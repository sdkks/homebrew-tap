class Termin8r < Formula
  desc "Headless virtual terminal for AI agents"
  homepage "https://github.com/sdkks/termin8r"
  url "https://github.com/sdkks/termin8r/releases/download/v0.5.6/termin8r_macos_aarch64"
  version "0.5.6"
  sha256 "c077ab373b90d41ddefa6eaa893d2d716d7e12379048a294e1884cbd6ea7bd29"

  def install
    bin.install "termin8r_macos_aarch64" => "termin8r"
  end

  def caveats
    <<~EOS
      If macOS prevents this binary from running due to Gatekeeper, clear the quarantine flag manually:
        xattr -dr com.apple.quarantine #{opt_bin}/termin8r
    EOS
  end

  test do
    assert_match "0.5.6", shell_output("#{bin}/termin8r --version")
  end
end
