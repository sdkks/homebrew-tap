class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.4.1/symbol-index-v0.4.1-aarch64-apple-darwin.tar.gz"
  version "0.4.1"
  sha256 "22c37f91aaa87a33b4303d047e36de92c9d3f189cf04f8cc6cf653bf627c3a6d"

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
    assert_match "0.4.1", shell_output("#{bin}/symbol-index --version")
  end
end
