cask "i4tools" do
  version "1.12.005"
  sha256 "f81496966e06ac0870f4e77c2ab26e7225099c007bdfa90a01b1e5ae1533f9ee"

  url "https://d-updater.i4.cn/i4mac/20210930/0/i4Tools_v#{version}.dmg"
  name "i4tools"
  name "爱思助手"
  desc "爱思助手是一款专业的苹果手机助手"
  homepage "https://www.i4.cn/pros.html"

  livecheck do
    skip "No version information available"
  end

  pkg "i4tools.pkg", allow_untrusted: true

  uninstall delete: "/Applications/i4tools.app"
end
