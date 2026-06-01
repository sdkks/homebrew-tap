class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.6.0/symbol-index-v0.6.0-aarch64-apple-darwin.tar.gz"
  version "0.6.0"
  sha256 "4000e26d64fdb338e14d45a8589b07643c3e8135beadcd3ca6d5f79c9975e351"

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
    assert_match "0.6.0", shell_output("#{bin}/symbol-index --version")
  end
end
