class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.3.1/otto-aarch64-apple-darwin.tar.xz"
      sha256 "8eb364d975bf67591f0cfe2ae9a0f33df16c49acd0cc158237214038839f9fda"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.3.1/otto-x86_64-apple-darwin.tar.xz"
      sha256 "8c713db73fedab7380adfb42cfb07feac0b9b124b518f2b7006503ac575d07d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.3.1/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "f3ba5f410e73355352c0d9d770de9c776e35e60d7e828d65425ce21fa4fffd0b"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.3.1/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "cbba70c6c142adc19b6308d394ec8863392941c60d6403519aa07b67edc861db"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
