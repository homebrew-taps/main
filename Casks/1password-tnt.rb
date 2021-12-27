cask "1password-tnt" do
  version "7.8"
  sha256 "b615fa4a67dc0bf131f8b5662e388da576898b580f69ab9947bda89de75018de"

  url "https://mirrors.xie.ke/Packages/macOS/1Password_7_v#{version}.dmg"
  name "1Password"
  desc "Password manager that keeps all passwords secure behind one password"
  homepage "https://1password.com"

  livecheck do
    skip "No version information available"
  end

  conflicts_with cask: "homebrew/cask-versions/1password-beta"
  depends_on macos: ">= :high_sierra"

  pkg "1Password-#{version}_REPACK_TNT.pkg", allow_untrusted: true

  zap trash: [
    "~/Library/Application Scripts/*.agilebits.onepassword*",
    "~/Library/Containers/*.agilebits.onepassword*",
    "~/Library/Group Containers/2BUA8C4S2C.com.agilebits",
    "~/Library/Logs/1Password",
    "~/Library/Preferences/com.agilebits.onepassword*",
  ]
end
