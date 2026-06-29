class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.20.3/symbol-index-v0.20.3-aarch64-apple-darwin.tar.gz"
  version "0.20.3"
  sha256 "4569b84ae20cf0160ebead1168134b54e91966c81c69fe987c0dbfa64f3cdba0"

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
    assert_match "0.20.3", shell_output("#{bin}/symbol-index --version")
  end
end
