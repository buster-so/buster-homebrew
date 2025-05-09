# typed: false
# frozen_string_literal: true

class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  version "0.1.4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v0.1.4/buster-cli-darwin-arm64.tar.gz"
      sha256 "edaae81f1d856f64ab349bbd1865b8f1a5d27567da90231f6ee2a8561100ac25"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.1.4/buster-cli-darwin-x86_64.tar.gz"
      sha256 "58e91d8c28833ee7371be445a7f5f1152458bf35cd93a79055e638fbb4955f14"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.1.4/buster-cli-linux-x86_64.tar.gz"
    sha256 "5a943fecaf1cd01919ccef19ad0222c151e5c08e5f7ce2c86ad30aeed008fd27"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

