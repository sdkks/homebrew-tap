class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.13.0/symbol-index-v0.13.0-aarch64-apple-darwin.tar.gz"
  version "0.13.0"
  sha256 "9ba71cddf527843429459bfa0d3580f1504ee95b1b50905aaaba6b255d97dacf"

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
    assert_match "0.13.0", shell_output("#{bin}/symbol-index --version")
  end
end
