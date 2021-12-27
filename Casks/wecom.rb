cask "wecom" do
  version "3.1.23.90391"
  sha256 "aa766d30097ce72c1b601e4a2ba5c6bef226aef5dc2c5b48f5797d00a0717b44"

  url "https://dldir1.qq.com/wework/work_weixin/WeCom_#{version}.dmg"
  name "wecom"
  name "企业微信"
  desc "腾讯微信团队为企业打造的企业通讯与办公工具"
  homepage "https://work.weixin.qq.com"

  app "企业微信.app",target: "Wecom.app"
end
