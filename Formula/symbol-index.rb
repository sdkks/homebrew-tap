class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.15.0/symbol-index-v0.15.0-aarch64-apple-darwin.tar.gz"
  version "0.15.0"
  sha256 "0d64a650937bd522673454b60aa6e425818d8c3bcaa0afc50d2402b99eca84c5"

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
    assert_match "0.15.0", shell_output("#{bin}/symbol-index --version")
  end
end
