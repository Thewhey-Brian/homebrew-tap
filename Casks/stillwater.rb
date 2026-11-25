cask "stillwater" do
  version "0.6.21"
  sha256 "e423a48d6e0e51a7b655d5ca04038f42ffb645eaa108ed6338ece099fa1c1a0e"

  url "https://stillwater.rockystonelabs.com/download/Stillwater-#{version}.dmg"
  name "Stillwater"
  desc "Menu bar monitor for Macs running coding agents"
  homepage "https://stillwater.rockystonelabs.com/"

  livecheck do
    url "https://stillwater.rockystonelabs.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sequoia"

  app "Stillwater.app"
  binary "#{appdir}/Stillwater.app/Contents/Helpers/stillwater"

  uninstall quit: "app.stillwater.Stillwater"

  zap trash: [
    "~/Library/Application Support/Pulse",
    "~/Library/Application Support/Stillwater",
    "~/Library/Caches/app.stillwater.Stillwater",
    "~/Library/HTTPStorages/app.stillwater.Stillwater",
    "~/Library/Preferences/app.stillwater.Stillwater.plist",
  ]
end
