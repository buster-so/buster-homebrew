class Buster < Formula
    desc "Command-line interface for managing semantic models in Buster"
    homepage "https://github.com/buster-so/buster"
    url "https://github.com/buster-so/buster/releases/latest/download/buster-cli-darwin-arm64.tar.gz"
    sha256 "0a4b8d2bcfb17ad4a331e26808398da4f7fb060b23de9f9ba54a6b3632999dd0"
    license "MIT"
  
    version "<VERSION>" # Replace with actual version, e.g., "1.0.0"
  
    on_macos do
      on_arm do
        url "https://github.com/buster-so/buster/releases/latest/download/buster-cli-darwin-arm64.tar.gz"
        sha256 "0a4b8d2bcfb17ad4a331e26808398da4f7fb060b23de9f9ba54a6b3632999dd0"
      end
      on_intel do
        url "https://github.com/buster-so/buster/releases/latest/download/buster-cli-darwin-x86_64.tar.gz"
        sha256 "<X86_64_CHECKSUM>" # Replace with macOS Intel SHA256 checksum
      end
    end
  
    on_linux do
      url "https://github.com/buster-so/buster/releases/latest/download/buster-cli-linux-x86_64.tar.gz"
      sha256 "<LINUX_CHECKSUM>" # Replace with Linux SHA256 checksum
    end
  
    def install
      bin.install "buster-cli" => "buster"
    end
  
    test do
      assert_match "buster", shell_output("#{bin}/buster --help")
    end
  end