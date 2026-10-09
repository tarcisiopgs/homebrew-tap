class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.6.1/otto-aarch64-apple-darwin.tar.xz"
      sha256 "d46ec997ca98a438b97a36000cf02035448c71ad77fc15b5b7c6e319e8a94f22"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.6.1/otto-x86_64-apple-darwin.tar.xz"
      sha256 "4cb3aceb7b05e75c04e9933050f936abeb6c5b60a7d252286bcf5078b31a6788"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.6.1/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "a2945a35507ae8b08bbf06ae895c6386cb777b0ae3cf6e8d30cfd1cd7546bd52"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.6.1/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "acfdee90199d4ee8b0c93e4ef88ea4a38e0a8adc535646e201446f5ce9889ef0"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
