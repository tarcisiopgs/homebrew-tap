class Devsweep < Formula
  desc "Find and remove what a developer's machine accumulates"
  homepage "https://github.com/tarcisiopgs/devsweep"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.1/devsweep-aarch64-apple-darwin.tar.xz"
      sha256 "9239ce8b37bc0b4dd7c70e0cc5ac8e3cc6e7d55014f89d25641fcb560848fa40"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.1/devsweep-x86_64-apple-darwin.tar.xz"
      sha256 "06364c21e3428968a56b4be5651ce9bd7626a1a6a69572733edccd51d145eba9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.1/devsweep-aarch64-unknown-linux-musl.tar.xz"
      sha256 "6621df136e8f526c2f53554b1029f4f10eb8fdf0e2d39a620cf8f88a6f5b9442"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.1/devsweep-x86_64-unknown-linux-musl.tar.xz"
      sha256 "7a08e200ef8ac15dcc3b35cddfa41731d98b2a361cf9ae4bf9cbe3a09e588a19"
    end
  end

  def install
    bin.install "devsweep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devsweep --version")
  end
end
