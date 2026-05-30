class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.2.2/symbol-index-v0.2.2-aarch64-apple-darwin.tar.gz"
  version "0.2.2"
  sha256 "8175ba3797936924b37385d6d0bf0fcff88d561b2c06db01c4fed06e460590f5"

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
    assert_match "0.2.2", shell_output("#{bin}/symbol-index --version")
  end
end
