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
      sha256 "ad563d6c99b1a9dde435de1b08cfd530ea1ebe65fab0b9743d93da7411ad7891"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.2.3/buster-cli-darwin-x86_64.tar.gz"
      sha256 "ae544c5db26591263e4c3d35d76f3126bb73ce631737678088b7d2f52abc6036"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.2.3/buster-cli-linux-x86_64.tar.gz"
    sha256 "395fde1b2ef0853e6fe893e61c0b50f02c716dc7c4be79c65358584b8120eccd"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

