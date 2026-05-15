class Termin8r < Formula
  desc "Headless virtual terminal for AI agents"
  homepage "https://github.com/sdkks/termin8r"
  url "https://github.com/sdkks/termin8r/releases/download/v0.5.2/termin8r_macos_aarch64"
  version "0.5.2"
  sha256 "0c3befe2f4a84209764458d1a89e6142ad929b10fc45ae2e65a6705cca70635d"

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
