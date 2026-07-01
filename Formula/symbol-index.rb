class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.21.0/symbol-index-v0.21.0-aarch64-apple-darwin.tar.gz"
  version "0.21.0"
  sha256 "f40ed54aabd9c21f1c016b2fab9b461ada995e61b836b38cff7813a5b7e10896"

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
    assert_match "0.21.0", shell_output("#{bin}/symbol-index --version")
  end
end
