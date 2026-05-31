class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.2.4/symbol-index-v0.2.4-aarch64-apple-darwin.tar.gz"
  version "0.2.4"
  sha256 "e324f04c4c60e9502ee3b6aae41f36c568c72066784b939072e22a49550d9457"

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
    assert_match "0.2.4", shell_output("#{bin}/symbol-index --version")
  end
end
