class Doggo < Formula
  desc "🐶 Command-line DNS Client for Humans. Written in Golang"
  homepage "https://github.com/mr-karan/doggo"
  version "0.5.3"
  url "https://github.com/mr-karan/doggo/releases/download/v#{version}/doggo_#{version}_darwin_amd64.tar.gz"
  sha256 "3d3322690ca987ea850038f7c589f2a951a9146d10cb8f058252963757193940"
  license "GPL-or-later"

  def install
    bin.install "doggo"
    bin.install "doggo-api.bin" => "doggo-api"
    zsh_completion.install "completions/doggo.zsh" => "_doggo"
    fish_completion.install "completions/doggo.fish"
  end
end
