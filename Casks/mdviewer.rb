cask "mdviewer" do
  version "2.0.4"
  sha256 "96de9b85a1c0fe391962e96b41def108752992df50a62d62d1bfb191c74982c9"

  url "https://github.com/sdkks/mdviewer/releases/download/v#{version}/MDViewer-#{version}.zip"
  name "MDViewer"
  desc "Minimal native macOS Markdown viewer"
  homepage "https://github.com/sdkks/mdviewer"

  app "MDViewer.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MDViewer.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.torstenmahr.MDViewer.plist",
    "~/Library/Application Support/MDViewer",
  ]
end
