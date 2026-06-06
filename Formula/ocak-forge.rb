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
  version "1.13.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.13.2/ocak-forge-darwin-arm64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "22a63311ccd198b4c6741732680bf0a6aae7b15058e1542f47957d17d4458170"
    else
      url "https://github.com/sdkks/ocak-forge/releases/download/v1.13.2/ocak-forge-darwin-x64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "40f91b8cde5b1b3a13b3f51247cbf26398f2f2822fcaa13221c69bac16dc8a33"
    end
  end

  def install
    bin.install cached_download => "ocak-forge"
  end

  test do
    system "#{bin}/ocak-forge", "version"
  end
end
