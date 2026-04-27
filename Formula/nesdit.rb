class Nesdit < Formula
  desc "Edit structured config files with jq-style queries"
  homepage "https://sdkks.github.io/nesdit/"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_darwin_arm64.tar.gz"
      sha256 "6e5a821655ead9a6cbd0bf12481de8126b6db8e4ce006a76ea13e267fe3e999e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_arm64.tar.gz"
      sha256 "1d761a822dbf0870965cb2f042ed906c9774fb858da1530c1b2747f5538dfdaa"
    end

    on_intel do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_amd64.tar.gz"
      sha256 "39dcd50994d1288192df245f2b8ab3cc3c5c334988a27890818cc704d32ca090"
    end
  end

  def install
    bin.install "nesdit"
    man1.install "share/man/man1/nesdit.1" if File.exist?("share/man/man1/nesdit.1")
  end

  test do
    system "#{bin}/nesdit", "--help"
  end
end
