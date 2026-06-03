class Folor < Formula
  desc "Recursive tail -f with glob pattern matching"
  homepage "https://github.com/sdkks/folor"
  url "https://github.com/sdkks/folor/releases/download/v0.3.1/folor-v0.3.1-aarch64-apple-darwin.tar.gz"
  version "0.3.1"
  sha256 "7c7572aa3d6dc3bac9f384c2187197acd5c908bb92cb2014761e54251aee8b0e"

  def install
    bin.install "folor"
  end

  def caveats
    <<~EOS
      If macOS prevents this binary from running due to Gatekeeper, clear the quarantine flag manually:
        xattr -dr com.apple.quarantine #{opt_bin}/folor
    EOS
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/folor --version")
  end
end
