class ClashPremium < Formula
  desc "Clash Premium Version,a Rule-based tunnel in Go"
  homepage "https://github.com/Dreamacro/clash/releases/tag/premium"
  version "2023.08.17"
  url "https://github.com/Dreamacro/clash/releases/download/premium/clash-darwin-amd64-v3-#{version}.gz"
  sha256 "e310a79717046e30dd123f9a3a5b8b8dbbd938fb7e58d2dc65396d58dd77755c"
  conflicts_with "clash", because: "both install `clash` binaries"
  license "GPL-3.0-only"

  def install
    bin.install "clash-darwin-amd64-v3" => "clash"
  end

  service do
    run opt_bin/"clash"
    keep_alive true
    error_log_path var/"log/clash-premium-err.log"
    log_path var/"log/clash-premium.log"
  end
end
