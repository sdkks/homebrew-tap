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
  version "0.50.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sdkks/opi/releases/download/v0.50.1/opi-darwin-arm64.tar.gz",
          using: GhPrivateReleaseDownloadStrategy
      sha256 "915c70345267196c8609a14a33719fd73827ee9048e5aa89fcbcb8d780f578d4"
    else
      odie "Intel (x86_64) macOS builds are not currently provided. Use an Apple Silicon Mac or build from source."
    end
  end

  def install
    bin.install "opi-darwin-arm64" => "opi"
  end

  test do
    system "#{bin}/opi", "--version"
  end
end
