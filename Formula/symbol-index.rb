class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.2.0/symbol-index-v0.2.0-aarch64-apple-darwin.tar.gz"
  version "0.2.0"
  sha256 "16021e629eb6294ef50ac9810acb9193cd236ec8793603d27b77b598e838bc31"

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
    assert_match "0.2.0", shell_output("#{bin}/symbol-index --version")
  end
end
