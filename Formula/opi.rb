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
  version "0.8.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/opi/releases/download/v0.8.3/opi-darwin-arm64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "33b11c628fb8c352b3e694f068b92512f6d7f595139218a5ddd1cd5bd10f4d97"
    else
      url "https://github.com/sdkks/opi/releases/download/v0.8.3/opi-darwin-x64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "780eace1a30dd0713b26a3f63cf3d1fa7dbd918d7e6e6552ea27a9603b65d042"
    end
  end

  def install
    bin.install cached_download => "opi"
  end

  test do
    system "#{bin}/opi", "--version"
  end
end
