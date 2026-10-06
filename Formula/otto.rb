class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.3.0/otto-aarch64-apple-darwin.tar.xz"
      sha256 "0a224b21bbd31a890bf5ecca16915aae907fe528e961c81d94a3b1c444cea3bd"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.3.0/otto-x86_64-apple-darwin.tar.xz"
      sha256 "7db7b5ecc7f21b330903f845c756f63726a7e1858c6f758c9df88da09f1866f9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.3.0/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "377119c17d4c5e9e78b812684a2536905f40fb94dc4af77773d70b5e81c7b0f0"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.3.0/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "9460ec4176e60a8c55173363f1ad756967367dfe28b720940b799a2a6f3092fa"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
