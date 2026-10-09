class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.6.0/otto-aarch64-apple-darwin.tar.xz"
      sha256 "881eca538cb52d98adcac07b17c360b3311fb68721e5a69c1d0b1a05f38f1dc3"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.6.0/otto-x86_64-apple-darwin.tar.xz"
      sha256 "22104e43b66cc9cd5150927f2f792e3832ccfa9df21000b8d139007b69b4cc65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.6.0/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "2beae47fe8cf521c65b4fa9c3d470def123bdd642a46a8ef20f598160a3e4918"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.6.0/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "1d898377047ac267608cf98545927e5ada3d68f68dc1176de9c590149e470c9d"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
