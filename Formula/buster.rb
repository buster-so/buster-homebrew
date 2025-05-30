# typed: false
# frozen_string_literal: true

class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  version "0.1.36"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v0.1.36/buster-cli-darwin-arm64.tar.gz"
      sha256 "5b92db330607193da9fff72696511f23b7499dd203320fa953fe8dc518224dfa"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.1.36/buster-cli-darwin-x86_64.tar.gz"
      sha256 "8a340c010276e78946d25b8f1b6cf48de1bf0aeb2616e3bde43f61d5da8c2320"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.1.36/buster-cli-linux-x86_64.tar.gz"
    sha256 "d002c4927709c349b8b0a40684495c9a30f5255497eccb8e13935ae3d4a9e85e"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

