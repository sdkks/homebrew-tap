class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.16.1/symbol-index-v0.16.1-aarch64-apple-darwin.tar.gz"
  version "0.16.1"
  sha256 "eb425b5be405c422d6ec6bc9c295eb30e437a2de618192d476ebacc4877fd0bc"

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
    assert_match "0.16.1", shell_output("#{bin}/symbol-index --version")
  end
end
