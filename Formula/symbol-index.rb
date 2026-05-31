class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.4.0/symbol-index-v0.4.0-aarch64-apple-darwin.tar.gz"
  version "0.4.0"
  sha256 "8ec89274cb8728fbae34bee3dce228a40b8d4c270584eb83758c54d52e13d7ca"

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
    assert_match "0.4.0", shell_output("#{bin}/symbol-index --version")
  end
end
