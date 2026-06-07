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
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/opi/releases/download/v0.8.0/opi-darwin-arm64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "8c282ae9bbc3867dcc48ff0512516edc4fc7898e3cdd6d4da899b52e500011d4"
    else
      url "https://github.com/sdkks/opi/releases/download/v0.8.0/opi-darwin-x64",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "3d4a49477c5538920962c14765fafd48b8e7697fc69eaa9c74127f6423337615"
    end
  end

  def install
    bin.install cached_download => "opi"
  end

  test do
    system "#{bin}/opi", "--version"
  end
end
