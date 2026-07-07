class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.22.0/symbol-index-v0.22.0-aarch64-apple-darwin.tar.gz"
  version "0.22.0"
  sha256 "fc7caf4bb75264511a445cb384ab46558bcd0b6b4bfdf34ab3239eb24db23f23"

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
    assert_match "0.22.0", shell_output("#{bin}/symbol-index --version")
  end
end
