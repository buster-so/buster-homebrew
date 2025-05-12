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
      sha256 "46c659a027f9dfb386ae584dbfd911c9878d97f1123fdde3e0094fc285353229"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.1.5/buster-cli-darwin-x86_64.tar.gz"
      sha256 "bb2a4cc1af6e17c474723c4ca27751e365cc2de87f1923587dcc9767d699ad59"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.1.5/buster-cli-linux-x86_64.tar.gz"
    sha256 "dd54d060df5047c3686f2e183036a60760e92c275b29770633720161fa431bf8"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

