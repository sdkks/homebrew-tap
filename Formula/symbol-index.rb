class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.20.2/symbol-index-v0.20.2-aarch64-apple-darwin.tar.gz"
  version "0.20.2"
  sha256 "8710d9cb5990c15bf4db79ee57389c42b038ed74abc3e44fbbc9c26b98287ebe"

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
    assert_match "0.20.2", shell_output("#{bin}/symbol-index --version")
  end
end
