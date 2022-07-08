class ClashPremium < Formula
  desc "Clash Premium Version,a Rule-based tunnel in Go"
  homepage "https://github.com/Dreamacro/clash/releases/tag/premium"
  version "2022.07.07"
  url "https://github.com/Dreamacro/clash/releases/download/premium/clash-darwin-amd64-#{version}.gz"
  sha256 "ccdb2760be48c2f51106fcc16c995cbd7d1a64cd5f742f44c9cba8ddc9bcba9c"
  license "GPL-3.0-only"

  def install
    bin.install "clash-darwin-amd64" => "clash-premium"
  end

  service do
    run opt_bin/"clash-premium"
    keep_alive true
    error_log_path var/"log/clash-premium.log"
    log_path var/"log/clash-premium.log"
  end
end
