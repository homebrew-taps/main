class Q < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.15.1"
  url "https://github.com/natesales/q/releases/download/v#{version}/q_#{version}_darwin_amd64.tar.gz"
  sha256 "3826f944c073ab68b76fe25687468bbb7604f3e0033362f1deb23b075bdae17b"
  license "GPL-or-later"

  def install
    bin.install "q" => "q"
    doc.install "README.md"
  end
end
