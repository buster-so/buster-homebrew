# typed: false
# frozen_string_literal: true

class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  version "0.3.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-darwin-arm64.tar.gz"
      sha256 "3deac1c33ef2a4ac99b54676966f99a8bfd55bbea983a611c44724a9506b84c4"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-darwin-x86_64.tar.gz"
      sha256 "11429c2dee168499af87bb2da1c339b9fd240e78cdb57e27038e072cec017e23"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-linux-x86_64.tar.gz"
    sha256 "741e47990e4ad394534b28b268048e4470eb7b5853685c12f1f6b1ea2c4e1ef4"
  end

  def install
    bin.install "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

