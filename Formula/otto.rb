class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.1.1/otto-aarch64-apple-darwin.tar.xz"
      sha256 "935177464a2086c10ba58aaa15fabea50cdb502f7452a09771df6461cbee8230"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.1.1/otto-x86_64-apple-darwin.tar.xz"
      sha256 "f10229a6cc7bb68dc2d213e3b43ebbe0f571b00439275662815d305b79796397"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.1.1/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "5cc462d7427a09009e6969e6beb9b387dda71617c9b99d257e6eb516d6d3268d"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.1.1/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "048165f0918138c3f7e6196223ba024b23b466951547c442b49a45fc2157f519"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
