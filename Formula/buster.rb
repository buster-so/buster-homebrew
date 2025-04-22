class Buster < Formula
    desc "Command-line interface for managing semantic models in Buster"
    homepage "https://github.com/buster-so/buster"
    url "https://github.com/buster-so/buster/releases/download/v0.0.7/buster-cli-darwin-arm64.tar.gz"
    sha256 "0a4b8d2bcfb17ad4a331e26808398da4f7fb060b23de9f9ba54a6b3632999dd0"
    license "MIT"
  
    livecheck do
      url :stable
      regex(/^v?(\d+(?:\.\d+)*)$/i)
    end
  
    version "0.0.7"
  
    on_macos do
      on_arm do
        url "https://github.com/buster-so/buster/releases/download/v0.0.7/buster-cli-darwin-arm64.tar.gz"
        sha256 "0a4b8d2bcfb17ad4a331e26808398da4f7fb060b23de9f9ba54a6b3632999dd0"
      end
      on_intel do
        url "https://github.com/buster-so/buster/releases/download/v0.0.7/buster-cli-darwin-x86_64.tar.gz"
        sha256 "2d7dd166c2af99a81e7b02786cc2698a527e6cd90ea2f6de7a0e659320929db2"
      end
    end
  
    on_linux do
      url "https://github.com/buster-so/buster/releases/download/v0.0.7/buster-cli-linux-x86_64.tar.gz"
      sha256 "0611b8ee4f00fbf709483f9c1fbf29047c4e1ca346cc7e863b7d47c560adf193"
    end
  
    def install
      bin.install "buster-cli" => "buster"
    end
  
    test do
      assert_match "buster", shell_output("#{bin}/buster --help")
    end
  end