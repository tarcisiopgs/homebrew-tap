class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.1.0/otto-aarch64-apple-darwin.tar.xz"
      sha256 "48b8a0fee05051d75aaf2c181448a0b803f41f857655fa279e190871805b4bb5"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.1.0/otto-x86_64-apple-darwin.tar.xz"
      sha256 "bf9b3dec9233741dea76ffa7320e3546de18fae75bf9a7590659f8dda91bdf52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.1.0/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "5715f56f06d2d7807140afca041f25b69ff699e24bb34db4b76295c171c30fca"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.1.0/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "0b87d68b6d8f99bffe0fbc0218ecec2cb9666f39915d2e331532def3b8894fba"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
