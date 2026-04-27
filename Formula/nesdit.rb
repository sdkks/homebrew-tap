class Nesdit < Formula
  desc "Edit structured config files with jq-style queries"
  homepage "https://sdkks.github.io/nesdit/"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_darwin_arm64.tar.gz"
      sha256 "45859a662317a0c2d712e355631ff67a8deaa9f2f1437278ed23686a91560678"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_arm64.tar.gz"
      sha256 "0e1561a0c2ffa355ec05e312612895fcbec37653d3d484d64b45c96783b13a88"
    end

    on_intel do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_amd64.tar.gz"
      sha256 "379d473911998cde9ce274b50b55aa214b236ecf6d2bfb161a843165105ad978"
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
