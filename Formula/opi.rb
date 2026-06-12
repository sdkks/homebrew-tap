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
  version "0.9.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/opi/releases/download/v0.9.6/opi-darwin-arm64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "1cb1b49c207530307dc3d5fb9ceda2e3d3e8ea765691b1bf664d480887627df1"
    else
      url "https://github.com/sdkks/opi/releases/download/v0.9.6/opi-darwin-x64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "a366c7f194a715702235264fd3b69d3b48e3cc8419d4af275c1e2108cbd83d9b"
    end
  end

  def install
    bin.install cached_download => "opi"
  end

  test do
    system "#{bin}/opi", "--version"
  end
end
