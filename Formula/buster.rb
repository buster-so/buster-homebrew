# typed: false
# frozen_string_literal: true

class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  version "0.2.3"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v0.2.3/buster-cli-darwin-arm64.tar.gz"
      sha256 "3048027596e2f4f6daaa7641e0839ba45c889e133fb381189ee41bb7e60ba28d"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.2.3/buster-cli-darwin-x86_64.tar.gz"
      sha256 "a8bcf45ede11ac48dfad5508ab123d0f57e546c0d4dc5edb0da609e775ca0ebe"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.2.3/buster-cli-linux-x86_64.tar.gz"
    sha256 "d059afbb9db003eed208667e5c959e1bfce2e28937906fa68501b8131909cbcd"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

