class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.5.1/symbol-index-v0.5.1-aarch64-apple-darwin.tar.gz"
  version "0.5.1"
  sha256 "54200c73706547d051d3abacde555d86ec2cff68991b09e150f0b45549dd1561"

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
    assert_match "0.5.1", shell_output("#{bin}/symbol-index --version")
  end
end
