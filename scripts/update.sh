#!/usr/bin/env bash
# Writes Formula/devsweep.rb for a devsweep release: the latest one, or the
# tag given as the first argument. The formula installs the binaries the
# release ships, so it needs nothing but their checksums.
set -euo pipefail

repo=tarcisiopgs/devsweep
tag=${1:-$(gh api "repos/${repo}/releases/latest" --jq .tag_name)}
version=${tag#v}
base="https://github.com/${repo}/releases/download/${tag}"

# A release is published before its binaries are attached: until all four
# checksums are there, the formula stays as it is.
sum() {
  curl -fsSL "${base}/devsweep-${1}.tar.xz.sha256" | cut -d " " -f 1
}
if ! mac_arm=$(sum aarch64-apple-darwin) ||
  ! mac_intel=$(sum x86_64-apple-darwin) ||
  ! linux_arm=$(sum aarch64-unknown-linux-musl) ||
  ! linux_intel=$(sum x86_64-unknown-linux-musl); then
  echo "${tag} has no binaries yet; leaving the formula alone"
  exit 0
fi

cd "$(dirname "${0}")/.."
mkdir -p Formula
cat > Formula/devsweep.rb <<RUBY
class Devsweep < Formula
  desc "Find and remove what a developer's machine accumulates"
  homepage "https://github.com/${repo}"
  license "MIT"

  on_macos do
    on_arm do
      url "${base}/devsweep-aarch64-apple-darwin.tar.xz"
      sha256 "${mac_arm}"
    end
    on_intel do
      url "${base}/devsweep-x86_64-apple-darwin.tar.xz"
      sha256 "${mac_intel}"
    end
  end

  on_linux do
    on_arm do
      url "${base}/devsweep-aarch64-unknown-linux-musl.tar.xz"
      sha256 "${linux_arm}"
    end
    on_intel do
      url "${base}/devsweep-x86_64-unknown-linux-musl.tar.xz"
      sha256 "${linux_intel}"
    end
  end

  def install
    bin.install "devsweep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devsweep --version")
  end
end
RUBY
echo "Formula/devsweep.rb is at ${version}"
