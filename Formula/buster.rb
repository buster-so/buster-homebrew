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
      sha256 "0f84ddf9d58e84dc05612ca8b70d93cca410536ce38ff461f9c6e5ec1f1405e8"
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-darwin-x86_64.tar.gz"
      sha256 "412e9e7995d8cb4e2fe0e6ff06c019895f30b297abd0e94c0032d9404f76c56f"
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-linux-x86_64.tar.gz"
    sha256 "87b1dd0f765900a2b11b520c567700ed6efbf05a82e63fefcbf5be39407dd173"
  end

  def install
    bin.install "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end

