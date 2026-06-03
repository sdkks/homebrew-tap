class Folor < Formula
  desc "Recursive tail -f with glob pattern matching"
  homepage "https://github.com/sdkks/folor"
  url "https://github.com/sdkks/folor/releases/download/v0.2.2/folor-v0.2.2-aarch64-apple-darwin.tar.gz"
  version "0.2.2"
  sha256 "dfac80f49b4f83b87b97f9f76d0f9022d09179cb272d5c2b8074916c0df2a1bd"

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
    assert_match "0.2.2", shell_output("#{bin}/folor --version")
  end
end
