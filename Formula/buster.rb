class Buster < Formula
    desc "Command-line interface for managing semantic models in Buster"
    homepage "https://github.com/buster-so/buster"
    url "https://github.com/buster-so/buster/releases/download/v<VERSION>/buster-cli-darwin-arm64.tar.gz"
    sha256 "<ARM64_CHECKSUM>"
    license "MIT"
  
    livecheck do
      url :stable
      regex(/^v?(\d+(?:\.\d+)*)$/i)
    end
  
    version "<VERSION>"
  
    on_macos do
      on_arm do
        url "https://github.com/buster-so/buster/releases/download/v<VERSION>/buster-cli-darwin-arm64.tar.gz"
        sha256 "<ARM64_CHECKSUM>"
      end
      on_intel do
        url "https://github.com/buster-so/buster/releases/download/v<VERSION>/buster-cli-darwin-x86_64.tar.gz"
        sha256 "<X86_64_CHECKSUM>"
      end
    end
  
    on_linux do
      url "https://github.com/buster-so/buster/releases/download/v<VERSION>/buster-cli-linux-x86_64.tar.gz"
      sha256 "<LINUX_CHECKSUM>"
    end
  
    def install
      bin.install "buster-cli" => "buster"
    end
  
    test do
      assert_match "buster", shell_output("#{bin}/buster --help")
    end
  end