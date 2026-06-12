class SymbolIndex < Formula
  desc "MCP server for AI agents — symbol-level code search with semantic similarity"
  homepage "https://github.com/sdkks/symbol-index"
  url "https://github.com/sdkks/symbol-index/releases/download/v0.14.0/symbol-index-v0.14.0-aarch64-apple-darwin.tar.gz"
  version "0.14.0"
  sha256 "a1f7a593f49206b7e4192f46fa42681bdb64449cf7ee263a36e9a1a5ab7f4948"

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
    assert_match "0.14.0", shell_output("#{bin}/symbol-index --version")
  end
end
