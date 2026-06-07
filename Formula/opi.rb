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
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/opi/releases/download/v0.3.1/opi-darwin-arm64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "ef36d2c76641225df3951bc62bfe2fd0aa72cbba6e16573117e44a1ff9ad2e2e"
    else
      url "https://github.com/sdkks/opi/releases/download/v0.3.1/opi-darwin-x64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "7591a7123a916c37287e40fe6c75baf4cc8a0afa4460909686779578e9e2cbd1"
    end
  end

  def install
    bin.install cached_download => "opi"
  end

  test do
    system "#{bin}/opi", "--version"
  end
end
