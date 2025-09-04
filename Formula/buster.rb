# typed: false
# frozen_string_literal: true

class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  version "0.3.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-darwin-arm64.tar.gz"
      sha256 "f48a24384b56dbf08724e26447e8f05d04b77d6fee0495dd97abc3a15811531d"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-darwin-x86_64.tar.gz"
      sha256 "117fd7513f4d91f3198ab031e66431c90b6ae206979ec0ff82b951d9a88d9c1a"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-linux-x86_64.tar.gz"
    sha256 "9e4c786e360ecdfbff70e37e807fcf13d1ace39536ebbaf8384773211e42dcd7"
  end

  def install
    bin.install "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

