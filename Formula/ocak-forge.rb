require "download_strategy"
require "uri"
require "fileutils"

class GhPrivateReleaseDownloadStrategy < AbstractFileDownloadStrategy
  def fetch(timeout: nil)
    repo = "sdkks/ocak-forge"
    tag = "v#{version}"
    # Derive asset name from the URL basename (e.g. ocak-forge-darwin-arm64)
    uri = URI(url)
    asset = File.basename(uri.path)
    dest_dir = cached_location.dirname

    # Use full path to gh — Homebrew's sandbox may not have /opt/homebrew/bin on PATH.
    gh = which("gh") || "/opt/homebrew/bin/gh"

    ohai "Downloading #{asset} from #{repo} #{tag} via gh"
    unless system gh, "release", "download", tag,
                  "--repo", repo,
                  "--pattern", asset,
                  "--dir", dest_dir.to_s
      odie "gh release download failed — is gh installed and authenticated?"
    end

    downloaded = dest_dir/asset
    unless downloaded.exist?
      odie "Download missing: #{asset} (expected at #{downloaded})"
    end

    # Rename to match Homebrew's expected cached_location filename
    FileUtils.mv downloaded, cached_location
    cached_location
  end
end

class OcakForge < Formula
  desc "Companion CLI for the ocak Claude Code plugin — worktree management and session orchestration"
  homepage "https://github.com/sdkks/ocak-forge"
  version "1.12.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.12.2/ocak-forge-darwin-arm64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "ece9346f6c8cba9e3a0d5265582377008f91a721bd1b94dbd6bb8faddfd37214"
    else
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.12.2/ocak-forge-darwin-x64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "f4d15c6a51899dbe0d4b90005f76f7ee2f846061fdcd2dd188c2f531dcbe2b2a"
    end
  end

  def install
    bin.install cached_download => "ocak-forge"
  end

  test do
    system "#{bin}/ocak-forge", "version"
  end
end
