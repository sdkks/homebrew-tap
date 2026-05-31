class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.3.0/symbol-index-v0.3.0-aarch64-apple-darwin.tar.gz"
  version "0.3.0"
  sha256 "c8cdce43dffe19ae43f8205dd3492d4f68f5c2dee55b8ea799d66484126a5dab"

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
    assert_match "0.3.0", shell_output("#{bin}/symbol-index --version")
  end
end
