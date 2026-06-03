class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.12.1/symbol-index-v0.12.1-aarch64-apple-darwin.tar.gz"
  version "0.12.1"
  sha256 "3ffae8ebe277c6e9b6a24dd3a39db9eebdba711b85c96791b1dcc52a91c79216"

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
    assert_match "0.12.1", shell_output("#{bin}/symbol-index --version")
  end
end
