class Nesdit < Formula
  desc "Edit structured config files with jq-style queries"
  homepage "https://sdkks.github.io/nesdit/"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_darwin_arm64.tar.gz"
      sha256 "b418cfbf996fc46bf877f303ff7ceebeef486bb7bf9063a99dc4a0becd3215f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_arm64.tar.gz"
      sha256 "5cadcf3029212a099c20b8d6dc952f6ae1fa895d56284e75a47fd9c277588142"
    end

    on_intel do
      url "https://github.com/sdkks/nesdit/releases/download/v#{version}/nesdit_#{version}_linux_amd64.tar.gz"
      sha256 "6889151e49c3fdfcd1fd90bff9676cd5aa63d97d1c661ea547a53a0edda5598a"
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
