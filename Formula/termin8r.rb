class Termin8r < Formula
  desc "Headless virtual terminal for AI agents"
  homepage "https://github.com/sdkks/termin8r"
  url "https://github.com/sdkks/termin8r/releases/download/v0.2.1/termin8r_macos_aarch64"
  version "0.2.1"
  sha256 "9e5deadc59d13ecea77ab20fafad4f2e5aef0b414560a23552a0e3d56c275ab5"

  def install
    bin.install "termin8r_macos_aarch64" => "termin8r"
  end

  def post_install
    system "xattr", "-dr", "com.apple.quarantine", "#{bin}/termin8r"
  end

  test do
    system "#{bin}/termin8r", "--version"
  end
end
