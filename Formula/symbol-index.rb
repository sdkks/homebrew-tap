class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.5.0/symbol-index-v0.5.0-aarch64-apple-darwin.tar.gz"
  version "0.5.0"
  sha256 "2b4e7b8f1f1f6304d4b9fa44030f91c235a2c9649be9933a11eea1bc31e605c8"

  def install
    bin.install "symbol-index"
  end

  def caveats
    <<~EOS
      If macOS prevents this binary from running due to Gatekeeper, clear the quarantine flag manually:
        xattr -dr com.apple.quarantine #{opt_bin}/symbol-index
    EOS
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/symbol-index --version")
  end
end
