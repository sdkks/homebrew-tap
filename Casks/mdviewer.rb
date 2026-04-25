cask "mdviewer" do
  version "2.0.3"
  sha256 ""

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
