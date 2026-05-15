class Termin8r < Formula
  desc "Headless virtual terminal for AI agents"
  homepage "https://github.com/sdkks/termin8r"
  url "https://github.com/sdkks/termin8r/releases/download/v0.5.3/termin8r_macos_aarch64"
  version "0.5.3"
  sha256 "b5a0c8b438c648f643b6f126238b6122a85d532088b036786d78e932ba9a86fe"

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
