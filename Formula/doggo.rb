class Doggo < Formula
  desc "🐶 Command-line DNS Client for Humans. Written in Golang"
  homepage "https://github.com/mr-karan/doggo"
  version "0.5.6"
  url "https://github.com/mr-karan/doggo/releases/download/v#{version}/doggo_#{version}_darwin_amd64.tar.gz"
  sha256 "355d3fedd485ded52879f15cec5bf91f314cdcce22db6a70c9fc0619a67d4e54"
  license "GPL-or-later"

  def install
    bin.install "doggo" => "doggo-bin"
    bin.install "doggo-api.bin" => "doggo-api"
    zsh_completion.install "completions/doggo.zsh" => "_doggo"
    fish_completion.install "completions/doggo.fish"
  end
end
