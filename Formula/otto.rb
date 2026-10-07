class Otto < Formula
  desc "Scheduled runs for coding agents, on the scheduler your OS already has"
  homepage "https://github.com/tarcisiopgs/otto"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.4.0/otto-aarch64-apple-darwin.tar.xz"
      sha256 "4e0ea46be93ffd2abc486f42f544b18f4f2c8d79820550185be850cbbf5017ef"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.4.0/otto-x86_64-apple-darwin.tar.xz"
      sha256 "4df2bc5f68e8968d983f782981565a83026e9f2445ec36b5351a7c95b310a86a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.4.0/otto-aarch64-unknown-linux-musl.tar.xz"
      sha256 "60dc91f321f8c2b80102d394bf592723b993789bb8a0e9584f08bdc6838202e6"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/otto/releases/download/v0.4.0/otto-x86_64-unknown-linux-musl.tar.xz"
      sha256 "6800c2c70609d799e0948537f5f859d8f76518607ed8217a4a5ab030b42f22c7"
    end
  end

  def install
    bin.install "otto"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/otto --version")
  end
end
