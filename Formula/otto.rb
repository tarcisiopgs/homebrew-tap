class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.5.1/otto-aarch64-apple-darwin.tar.xz"
      sha256 "d1281fcf7d6df6ff095f10b95075091dda41986b8e8169ccd73dcb092e4c6891"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.5.1/otto-x86_64-apple-darwin.tar.xz"
      sha256 "b1ef541a9a87993e8af95e3c3e1222b0062adefc8cd59ee4aa347b108cb8fd06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.5.1/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "7b078f96e86f51542888690fd11c95dca3039dd77eebf9fb5523d7aa4b8b2bcb"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.5.1/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "9bf9197d7763e1711fc945a41d653117b47d6277e60131eec42bb0c1c5cf1c14"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
