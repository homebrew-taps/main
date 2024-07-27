class Q < Formula
  desc "A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH."
  homepage "https://github.com/natesales/q"
  version "0.19.2"
  url "https://github.com/natesales/q/releases/download/v#{version}/q_#{version}_darwin_amd64.tar.gz"
  sha256 "1a3b71d0eb7943f61a983115a79d2b8178ec66d3577430e60662d8e58950762a"
  license "GPL-or-later"

  def install
    bin.install "q" => "q"
    doc.install "README.md"
  end
end
