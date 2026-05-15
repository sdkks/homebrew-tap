class Termin8r < Formula
  desc "Headless virtual terminal for AI agents"
  homepage "https://github.com/sdkks/termin8r"
  url "https://github.com/sdkks/termin8r/releases/download/v0.4.0/termin8r_macos_aarch64"
  version "0.4.0"
  sha256 "899a85e5ecbbf8cbf1e51b69bbfc45ed21e45e25e5ef5d5d2e8067ffc4f5752e"

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
