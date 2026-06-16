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
  version "1.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.14.0/ocak-forge-darwin-arm64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "88abccdb2e968d736c9f03fa6aef08fd9441a4ae3795edfaa398eb1125e1297e"
    else
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.14.0/ocak-forge-darwin-x64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "ba3259addecd477243ec4d8633c509514b51a012b8657aec4a56a1b10fda0026"
    end
  end

  def install
    bin.install cached_download => "ocak-forge"
  end

  test do
    system "#{bin}/ocak-forge", "version"
  end
end
