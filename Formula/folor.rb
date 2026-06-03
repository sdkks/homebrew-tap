class Folor < Formula
  desc "Recursive tail -f with glob pattern matching"
  homepage "https://github.com/sdkks/folor"
  url "https://github.com/sdkks/folor/releases/download/v0.3.0/folor-v0.3.0-aarch64-apple-darwin.tar.gz"
  version "0.3.0"
  sha256 "ce3fd617f6bb7e4378c03b94fa132f89fd5129e762d62eec3c1588e4addbd11e"

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
    assert_match "0.3.0", shell_output("#{bin}/folor --version")
  end
end
