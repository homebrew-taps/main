cask "tuxera-ntfs-tnt" do
  version "2021"
  sha256 "ca9cdd55eef89fbcc8ff258adab052305fe38babb3f3cc21447dab86a856e075"

  url "https://mirrors.xie.ke/Packages/macOS/tuxerantfs_#{version}.dmg",
    verified: "mirrors.xie.ke"
  name "tuxera-ntfs-tnt"
  desc "Tuxera NTFS is a commercial NTFS driver developed from the popular open-source NTFS-3G driver, which is a natural part of all major Linux distributions, and also has lots of users on macOS, FreeBSD, Solaris, and NetBSD."
  homepage "https://ntfsformac.tuxera.com"

  pkg ".packages/Flat/Install Tuxera NTFS.mpkg"

  livecheck do
    skip "No version information available"
  end

  def caveats
    <<~EOS
      Block Outgoing connection witfh Firewall (LTS - Radio Silence etc...)

      3VV2VF-HQZ01U-MZ5ZU9-ZVEH45-H6CFE4
    EOS
  end

end
