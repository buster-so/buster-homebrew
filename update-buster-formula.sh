#!/bin/bash

# Script to update buster.rb with the latest version and checksums

REPO="buster-so/buster"
FORMULA_PATH="Formula/buster.rb"

# Get the latest release version
echo "Fetching latest release version..."
LATEST_VERSION=$(curl -s https://api.github.com/repos/$REPO/releases/latest | grep '"tag_name":' | sed -E 's/.*"v?([^"]+)".*/\1/')
if [ -z "$LATEST_VERSION" ]; then
  echo "Error: Could not fetch latest version."
  exit 1
fi
echo "Latest version: $LATEST_VERSION"

# Download tarballs
echo "Downloading tarballs..."
curl -L "https://github.com/$REPO/releases/download/v$LATEST_VERSION/buster-cli-darwin-arm64.tar.gz" -o buster-cli-darwin-arm64.tar.gz
curl -L "https://github.com/$REPO/releases/download/v$LATEST_VERSION/buster-cli-darwin-x86_64.tar.gz" -o buster-cli-darwin-x86_64.tar.gz
curl -L "https://github.com/$REPO/releases/download/v$LATEST_VERSION/buster-cli-linux-x86_64.tar.gz" -o buster-cli-linux-x86_64.tar.gz

# Calculate checksums
echo "Calculating checksums..."
ARM64_CHECKSUM=$(sha256sum buster-cli-darwin-arm64.tar.gz | awk '{print $1}')
X86_64_CHECKSUM=$(sha256sum buster-cli-darwin-x86_64.tar.gz | awk '{print $1}')
LINUX_CHECKSUM=$(sha256sum buster-cli-linux-x86_64.tar.gz | awk '{print $1}')

echo "ARM64 checksum: $ARM64_CHECKSUM"
echo "x86_64 checksum: $X86_64_CHECKSUM"
echo "Linux checksum: $LINUX_CHECKSUM"

# Clean up
rm buster-cli-darwin-arm64.tar.gz buster-cli-darwin-x86_64.tar.gz buster-cli-linux-x86_64.tar.gz

# Update formula
echo "Updating $FORMULA_PATH..."
sed -i '' "s/version ".*"/version "$LATEST_VERSION"/" "$FORMULA_PATH"
sed -i '' "s/sha256 ".*" # arm64_big_sur/sha256 "$ARM64_CHECKSUM" # arm64_big_sur/" "$FORMULA_PATH"
sed -i '' "s/sha256 ".*" # x86_64_big_sur/sha256 "$X86_64_CHECKSUM" # x86_64_big_sur/" "$FORMULA_PATH"
sed -i '' "s/sha256 ".*" # x86_64_linux/sha256 "$LINUX_CHECKSUM" # x86_64_linux/" "$FORMULA_PATH"
sed -i '' "s/v<VERSION>/v$LATEST_VERSION/g" "$FORMULA_PATH"

echo "Formula updated to version $LATEST_VERSION."