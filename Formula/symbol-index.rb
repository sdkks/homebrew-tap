class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.19.0/symbol-index-v0.19.0-aarch64-apple-darwin.tar.gz"
  version "0.19.0"
  sha256 "530d89dddfa75452377f325cffd8aed679d56a47cb3317d4527d4924fd30bc85"

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
    assert_match "0.19.0", shell_output("#{bin}/symbol-index --version")
  end
end
