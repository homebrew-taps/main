cask "okex" do
  version :latest
  sha256 :no_check

  url "https://okg-pub-hk.oss-cn-hongkong.aliyuncs.com/upgradeapp/OKEx.dmg"
  name "Okex"
  desc "世界领先的区块链数字资产交易平台。拥有银行级存储和风控，是全球最大的投资者在线交易平台。"
  homepage "https://www.okex.com"

  app "OKEx.app"
end
