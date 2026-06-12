require "download_strategy"
require "uri"
require "fileutils"

class GhPrivateReleaseDownloadStrategy < AbstractFileDownloadStrategy
  def fetch(timeout: nil)
    repo = "sdkks/opi"
    tag = "v#{version}"
    uri = URI(url)
    asset = File.basename(uri.path)
    dest_dir = cached_location.dirname

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

    FileUtils.mv downloaded, cached_location
    cached_location
  end
end

class Opi < Formula
  desc "pi.dev CLI harness — subagent orchestration, hooks, checkpointing, and SDLC lifecycle"
  homepage "https://github.com/sdkks/opi"
  version "0.9.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/opi/releases/download/v0.9.3/opi-darwin-arm64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "acd8721605fa991b3979508b63b7495987a8a5729acdbb61a1f98d0336146441"
    else
      url "https://github.com/sdkks/opi/releases/download/v0.9.3/opi-darwin-x64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "ea898a04fbe17c5425300d887a5b3c884a592d4162f121f7263486298a3ee717"
    end
  end

  def install
    bin.install cached_download => "opi"
  end

  test do
    system "#{bin}/opi", "--version"
  end
end
