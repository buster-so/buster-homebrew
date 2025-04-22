class Buster < Formula
    desc "Command-line interface for managing semantic models in Buster"
    homepage "https://github.com/buster-so/buster"
    url "https://github.com/buster-so/buster/releases/latest/download/buster-cli-darwin-arm64.tar.gz"
    sha256 "<SHA256_CHECKSUM_ARM64>" # Replace with ARM64 SHA256 checksum
    license "MIT"
  
    # Specify version (replace with the actual version from the GitHub release)
    version "<VERSION>" # e.g., "1.0.0"
  
    # Handle Intel macOS
    on_macos do
      on_arm do
        url "https://github.com/buster-so/buster/releases/latest/download/buster-cli-darwin-arm64.tar.gz"
        sha256 "<SHA256_CHECKSUM_ARM64>" # Replace with ARM64 SHA256 checksum
      end
      on_intel do
        url "https://github.com/buster-so/buster/releases/latest/download/buster-cli-darwin-x86_64.tar.gz"
        sha256 "<SHA256_CHECKSUM_X86_64>" # Replace with x86_64 SHA256 checksum
      end
    end
  
    # Handle Linux
    on_linux do
      url "https://github.com/buster-so/buster/releases/latest/download/buster-cli-linux-x86_64.tar.gz"
      sha256 "<SHA256_CHECKSUM_LINUX>" # Replace with Linux SHA256 checksum
    end
  
    def install
      bin.install "buster-cli" => "buster"
    end
  
    test do
      assert_match "buster", shell_output("#{bin}/buster --help")
    end
  end