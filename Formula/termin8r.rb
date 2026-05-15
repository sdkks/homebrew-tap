class Termin8r < Formula
  desc "Headless virtual terminal for AI agents"
  homepage "https://github.com/sdkks/termin8r"
  url "https://github.com/sdkks/termin8r/releases/download/v0.2.1/termin8r_macos_aarch64"
  version "0.2.1"
  sha256 ""

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
