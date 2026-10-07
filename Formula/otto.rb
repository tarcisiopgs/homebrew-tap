class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.5.0/otto-aarch64-apple-darwin.tar.xz"
      sha256 "44978b155adca6d7d1d897defa2000ecc5ecac9de626824a25e737ecc0271108"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.5.0/otto-x86_64-apple-darwin.tar.xz"
      sha256 "f832de66113dc273ef1005042cfa87a9f38ec5652f2784632babe31cb58ee11f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.5.0/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "e93036524ffeb75a9ebd10c77d33559e7a633ff21522267a75f58fae837e274a"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.5.0/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "669cd5f3a4624d69af220de25a090c54d6df3b9f6a1a3297696b5f607a1727ec"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
