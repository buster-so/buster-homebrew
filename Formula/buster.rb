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
      sha256 "44765231757d0b0f551f54d4a4b064ce60927c09a2717d8c6f3be0779c927882"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.2.3/buster-cli-darwin-x86_64.tar.gz"
      sha256 "b5c69d82faedd8189e606f86398404ce374cb2aaf0e31a4b3645358db21204ff"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.2.3/buster-cli-linux-x86_64.tar.gz"
    sha256 "1385783d75a1cb3b624f6975e8cf4d9f235d993e6577e210754e407a5086bec8"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

