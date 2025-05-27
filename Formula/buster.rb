# typed: false
# frozen_string_literal: true

class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  version "0.1.8"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v0.1.8/buster-cli-darwin-arm64.tar.gz"
      sha256 "21226e0a4f4245422db326cb4374d2ca64c6327d5a04dfd8b903aedb2643fef1"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v0.1.8/buster-cli-darwin-x86_64.tar.gz"
      sha256 "3b021b34411d40d6eff7b161c47b14598e0b9d47249ff9f6f6e881544cfa2410"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v0.1.8/buster-cli-linux-x86_64.tar.gz"
    sha256 "af4ab788a58039d14ee1f9eee251b7dfe9617530275e4ebca36ec1d6f23ca6f1"
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

