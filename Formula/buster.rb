# typed: false
# frozen_string_literal: true

class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  version "0.2.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v0.2.0/buster-cli-darwin-arm64.tar.gz"
      sha256 "28f27f417b7e111abf6dfd4458c848910bf671e339e3be679d32752da35f60af"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.2.0/buster-cli-darwin-x86_64.tar.gz"
      sha256 "a60a33f2dcfa770c013fbd29eea79b6c8d0a115f4396cdfb40549a25b5de4363"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.2.0/buster-cli-linux-x86_64.tar.gz"
    sha256 "45ae83464945674aae58905bd762485320ad185dfb9a30de575acda7a5d9b889"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

