class Devsweep < Formula
  desc "Find and remove what a developer's machine accumulates"
  homepage "https://github.com/tarcisiopgs/devsweep"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.3/devsweep-aarch64-apple-darwin.tar.xz"
      sha256 "ae8db72aafc2a27a3e0ac4cce8d631bea50639f0b638259a2c731fbd91939167"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.3/devsweep-x86_64-apple-darwin.tar.xz"
      sha256 "a9a5e68c101515495c7ab3ce4ad162a0ab1e994ab1be9b7ef9b7866164eae55b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.3/devsweep-aarch64-unknown-linux-musl.tar.xz"
      sha256 "5900baf45dc11e58cab72d919dd1de1e3e3f50804a1ba1ecee7da0492c01a85e"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.3/devsweep-x86_64-unknown-linux-musl.tar.xz"
      sha256 "ed8a40077fb89d78b66a98f0fbea56b42cd6e8f85e929e3ddde08c02046a2699"
    end
  end

  def install
    bin.install "devsweep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devsweep --version")
  end
end
