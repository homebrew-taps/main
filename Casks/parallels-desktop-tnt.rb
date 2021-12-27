cask "parallels-desktop-tnt" do
  version "17.1.1-51537"
  sha256 "bfe9e0ad1ccd22e38d29260a89e94bfaef7ada657c7d35d8f43a1672ee001512"

  url "https://mirrors.xie.ke/Packages/macOS/Parallels_Desktop_#{version}.dmg"
  name "Parallels Desktop"
  desc "Parallels Desktop is one of the oldest and most popular applications for virtualization on macOS"
  homepage "https://www.parallels.com"

  depends_on macos: ">= :high_sierra"

  app "Parallels Desktop.app"

  preflight do
    system_command "chflags",
                   args: ["nohidden", "#{staged_path}/Parallels Desktop.app"]
    system_command "xattr",
                   args: ["-d", "com.apple.FinderInfo", "#{staged_path}/Parallels Desktop.app"]
  end

  postflight do
    system_command "#{appdir}/Parallels Desktop.app/Contents/MacOS/inittool",
                   args: ["init"],
                   sudo: true
  end

  uninstall_preflight do
    set_ownership "#{appdir}/Parallels Desktop.app"
  end

  uninstall delete: [
    "/usr/local/bin/prl_convert",
    "/usr/local/bin/prl_disk_tool",
    "/usr/local/bin/prl_perf_ctl",
    "/usr/local/bin/prlcore2dmp",
    "/usr/local/bin/prlctl",
    "/usr/local/bin/prlexec",
    "/usr/local/bin/prlsrvctl",
  ]

end
