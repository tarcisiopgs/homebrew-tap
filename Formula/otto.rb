class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.2.0/otto-aarch64-apple-darwin.tar.xz"
      sha256 "fee0416f70e536808ee0ffa9ff498ecd4b2e64fc1a0a6400ed44a86d99d02b63"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.2.0/otto-x86_64-apple-darwin.tar.xz"
      sha256 "ee35772765c0a181624a1340a43ed90a30b8f59dbec0fd2098f793c3b631ed8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.2.0/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "729d9d22fdb1692b67d5d77643eae2f2be14d3b98b902009116ae4e293031d2c"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.2.0/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "e57026e7442401cc7113f095856fcad23359747aacf93c2bdb39468a51a5d00a"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
