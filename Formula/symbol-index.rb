class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.11.0/symbol-index-v0.11.0-aarch64-apple-darwin.tar.gz"
  version "0.11.0"
  sha256 "e6afe307fed5827149d513e2e3f4fedf989cb867f69e9bcd15d029a4cb35d30b"

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
    assert_match "0.11.0", shell_output("#{bin}/symbol-index --version")
  end
end
