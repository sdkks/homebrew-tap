class Nesdit < Formula
  desc "Edit structured config files with jq-style queries"
  homepage "https://sdkks.github.io/nesdit/"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_darwin_arm64.tar.gz"
      sha256 "c482125ed608ad0b8f6fd679fb0cf7a89ac3db3a64ac062d22a2e9e440e20f73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_arm64.tar.gz"
      sha256 "f4fcff56fa9e2677ab689b09fe34079c28cc8cce5499812c693d780c13ee8c63"
    end

    on_intel do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_amd64.tar.gz"
      sha256 "d8f3b916d0484f2830d34931eb41d4e91cb4ca84dcfeba5264273696308f8950"
    end
  end

  def install
    bin.install "nesdit"
    man1.install "share/man/man1/nesdit.1"
  end

  test do
    system "#{bin}/nesdit", "--help"
  end
end
