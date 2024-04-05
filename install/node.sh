#!/bin/bash
echo "Starting Node.js environment installation..."

# Add Node.js repository
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -

# Install Node.js
sudo apt-get update
sudo apt-get install -y nodejs

# Check Node.js and npm versions
node -v
npm -v

# Configure npm registry to use a mirror for faster downloads
npm config set registry https://registry.npmmirror.com

# Install pnpm globally
sudo npm i -g pnpm

# Add pnpm to PATH
echo 'export p=pnpm' >> ~/.bashrc
source ~/.bashrc

echo "Node.js installation successful. You can now use 'p' instead of 'pnpm' for package management."
echo "Starting Golang environment installation..."