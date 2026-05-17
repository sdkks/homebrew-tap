class OcakForge < Formula
  desc "Companion CLI for the ocak Claude Code plugin — worktree management and session orchestration"
  homepage "https://github.com/sdkks/ocak-forge"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.2.0/ocak-forge-darwin-arm64"
      sha256 "b3cefd3661bacae0dd96c1c3d2ba001e8414e3ec24552c6e3b0d5f849798d81e"
    else
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.2.0/ocak-forge-darwin-x64"
      sha256 "e15cf800c87ef8845c0233c406d84777efd0d370397bd54b7d680b3fceaf2dd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.2.0/ocak-forge-linux-arm64"
      sha256 "REPLACE_WITH_SHA256_LINUX_ARM64"
    else
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.2.0/ocak-forge-linux-x64"
      sha256 "REPLACE_WITH_SHA256_LINUX_X64"
    end
  end

  def install
    # The binary is distributed as a single-file executable with platform suffix.
    # Rename to plain 'ocak-forge' on install.
    bin.install Dir["ocak-forge-*"].first => "ocak-forge"
  end

  def post_install
    # Strip quarantine attribute so macOS doesn't block the binary with
    # "cannot be opened because it is from an unidentified developer."
    system "xattr", "-dr", "com.apple.quarantine", "#{bin}/ocak-forge"
  end

  test do
    system "#{bin}/ocak-forge", "version"
  end
end
