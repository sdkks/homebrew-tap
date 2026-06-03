class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.8.0/symbol-index-v0.8.0-aarch64-apple-darwin.tar.gz"
  version "0.8.0"
  sha256 "5a5912222be2bca3fc302b2475bd22a427280861056d8f207d5fcdd46d70dd15"

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
    assert_match "0.8.0", shell_output("#{bin}/symbol-index --version")
  end
end
