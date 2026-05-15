class Termin8r < Formula
  desc "Headless virtual terminal for AI agents"
  homepage "https://github.com/sdkks/termin8r"
  url "https://github.com/sdkks/termin8r/releases/download/v0.4.1/termin8r_macos_aarch64"
  version "0.4.1"
  sha256 "7c53fbcc0d73ca2ab6d867ac87a95bdd9d1573dbfe608c2ea16b068f44d07aa3"

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
