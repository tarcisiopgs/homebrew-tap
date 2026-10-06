class Devsweep < Formula
  desc "Find and remove what a developer's machine accumulates"
  homepage "https://github.com/tarcisiopgs/devsweep"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.2/devsweep-aarch64-apple-darwin.tar.xz"
      sha256 "3ee406e9e3c21c44352a7674d96b81f04f1a1125e228ff669387e3d1b4181f92"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.2/devsweep-x86_64-apple-darwin.tar.xz"
      sha256 "ea2888bb45f3d74b1b2320bf0a19d9b912cf29bec2859d4972e3369b20c7a77a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.2/devsweep-aarch64-unknown-linux-musl.tar.xz"
      sha256 "f40b48c675a6c48c54abd40167b69f3fa085a536687d78d4c1cb5ba98b5f29cc"
    end
    on_intel do
      url "https://github.com/tarcisiopgs/devsweep/releases/download/v0.4.2/devsweep-x86_64-unknown-linux-musl.tar.xz"
      sha256 "93fe1e5ad9dfd781b1268d0fb4faa2bbfe2902f5774a27dd6da52f78b5967f4f"
    end
  end

  def install
    bin.install "devsweep"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devsweep --version")
  end
end
