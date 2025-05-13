# typed: false
# frozen_string_literal: true

class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  version "0.1.5"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v0.1.5/buster-cli-darwin-arm64.tar.gz"
      sha256 "78aca2df8694a38e9b028f350becc9bc17f9b6de32f25c376c90331723f37ce3"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.1.5/buster-cli-darwin-x86_64.tar.gz"
      sha256 "c502dce4b231644e1590cf6b8ee266ac7504c3552430d49dfb7bde4fdd7d4b48"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.1.5/buster-cli-linux-x86_64.tar.gz"
    sha256 "a38a97a523bf46d7c6a7b7bcbb5f40b56156b6f21e6e811a01cf65f35423f8a7"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

