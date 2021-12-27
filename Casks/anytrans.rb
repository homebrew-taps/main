cask "anytrans" do
  version "8.9"
  sha256 "1cb8da2ef4c03f98e9ad00221c347787dac8a41d1f49d2f482918418e8e998b3"

  url "https://mirrors.xie.ke/Packages/macOS/AnyTrans_#{version}.dmg",
    verified: "mirrors.xie.ke"
  name "anytrans"
  desc "iPhone manager that breaks the sync boundary and consolidates every access to all your content in one place, including music, videos, photos, messages, books, Safari history, voice memo, etc."
  homepage "https://www.imobie.com/anytrans"

  app "AnyTrans.app"

  livecheck do
    skip "No version information available"
  end

end
