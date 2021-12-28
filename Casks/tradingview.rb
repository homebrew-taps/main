cask "tradingview" do
  version :latest
  sha256 :no_check

  url "https://tvd-packages.tradingview.com/stable/latest/darwin/TradingView.dmg"
  name "Tradingview Desktop"
  desc "交易者和投资者的超级图表平台和社交网络。"
  homepage "https://www.tradingview.com/"

  app "TradingView.app"
end
