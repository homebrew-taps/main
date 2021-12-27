cask "omni-recover" do
  version "3.1"
  sha256 "834a8c9fb8688b9f2e6429a89d53a6378f237e803b257da9f201c8e2b9f86235"

  url "https://mirrors.xie.ke/Packages/macOS/Omni_Recover_#{version}.dmg",
    verified: "mirrors.xie.ke"
  name "omni-recover"
  desc "Omni Recover for macOS lets you retrieve your deleted messages, photos, WhatsApp chats, and much more, no matter what stage you’ve reached."
  homepage "https://www.minicreo.com/omni-recover"

  app "Omni Recover.app"

  livecheck do
    skip "No version information available"
  end

end
