class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.17.0/symbol-index-v0.17.0-aarch64-apple-darwin.tar.gz"
  version "0.17.0"
  sha256 "2af6a2635209226f5d5b4550adaab57b050497a3a9610f3928a88fe75bd51c96"

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
    assert_match "0.17.0", shell_output("#{bin}/symbol-index --version")
  end
end
