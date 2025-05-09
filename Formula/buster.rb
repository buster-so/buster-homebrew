class Buster < Formula
  desc "Command-line interface for using buster Buster"
  homepage "https://github.com/buster-so/buster"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)*)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-darwin-arm64.tar.gz"
      # sha256 will be updated by `brew update` or `brew livecheck`
    end
    on_intel do
      url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-darwin-x86_64.tar.gz"
      # sha256 will be updated by `brew update` or `brew livecheck`
    end
  end

  on_linux do
    url "https://github.com/buster-so/buster/releases/download/v#{version}/buster-cli-linux-x86_64.tar.gz"
    # sha256 will be updated by `brew update` or `brew livecheck`
  end

  def install
    bin.install "buster-cli" => "buster"
  end

  test do
    assert_match "buster", shell_output("#{bin}/buster --help")
  end
end