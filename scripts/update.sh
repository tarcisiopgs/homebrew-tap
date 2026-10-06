#!/usr/bin/env bash
# Writes the formula of one project for one of its releases:
#
#   scripts/update.sh <devsweep|otto> [tag]
#
# The tag defaults to the project's latest release. A formula installs the
# binaries its release ships, so it needs nothing but their checksums.
set -euo pipefail

name=${1:?usage: scripts/update.sh <devsweep|otto> [tag]}
case "${name}" in
  devsweep)
    class=Devsweep
    desc="Find and remove what a developer's machine accumulates"
    ;;
  otto)
    class=Otto
    desc="Scheduled runs for coding agents, on the scheduler your OS already has"
    ;;
  *)
    echo "unknown formula: ${name}" >&2
    exit 1
    ;;
esac

repo="tarcisiopgs/${name}"
tag=${2:-$(gh api "repos/${repo}/releases/latest" --jq .tag_name)}
version=${tag#v}
base="https://github.com/${repo}/releases/download/${tag}"

# A release is published before its binaries are attached: until all four
# checksums are there, the formula stays as it is.
sum() {
  curl -fsSL "${base}/${name}-${1}.tar.xz.sha256" | cut -d " " -f 1
}
if ! mac_arm=$(sum aarch64-apple-darwin) ||
   ! mac_intel=$(sum x86_64-apple-darwin) ||
   ! linux_arm=$(sum aarch64-unknown-linux-musl) ||
   ! linux_intel=$(sum x86_64-unknown-linux-musl)
then
  echo "${name} ${tag} has no binaries yet; leaving the formula alone"
  exit 0
fi

cd "$(dirname "${0}")/.."
mkdir -p Formula
cat >"Formula/${name}.rb" <<RUBY
class ${class} < Formula
  desc "${desc}"
  homepage "https://github.com/${repo}"
  license "MIT"

  on_macos do
    on_arm do
      url "${base}/${name}-aarch64-apple-darwin.tar.xz"
      sha256 "${mac_arm}"
    end
    on_intel do
      url "${base}/${name}-x86_64-apple-darwin.tar.xz"
      sha256 "${mac_intel}"
    end
  end

  on_linux do
    on_arm do
      url "${base}/${name}-aarch64-unknown-linux-musl.tar.xz"
      sha256 "${linux_arm}"
    end
    on_intel do
      url "${base}/${name}-x86_64-unknown-linux-musl.tar.xz"
      sha256 "${linux_intel}"
    end
  end

  def install
    bin.install "${name}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/${name} --version")
  end
end
RUBY
echo "Formula/${name}.rb is at ${version}"
