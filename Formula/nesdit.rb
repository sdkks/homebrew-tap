class Nesdit < Formula
  desc "Edit structured config files with jq-style queries"
  homepage "https://sdkks.github.io/nesdit/"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_darwin_arm64.tar.gz"
      sha256 "88c125eda00695f0266fbd8528c57f71378b575a38155898bf5355c935a27c59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_arm64.tar.gz"
      sha256 "d5f9efc4a20258a68f6bc3535dd4fc767b1be6ef11edaf409ad8364d2a6be625"
    end

    on_intel do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_amd64.tar.gz"
      sha256 "0309fc4d92df3ddfdca43bc32b49f7cade0211f317104ec8e0e6d66660913b92"
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
