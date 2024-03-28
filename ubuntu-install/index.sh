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

# Download and extract Go binary
cd /usr/src
wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz

# Set GOROOT and GOPATH environment variables
echo 'export GOROOT=/usr/local/go' | sudo tee -a /etc/profile
mkdir $HOME/go
echo 'export GOPATH=$HOME/go' | sudo tee -a /etc/profile
echo 'export GOPROXY=http://goproxy.cn' | sudo tee -a /etc/profile
# Update PATH to include Go binaries
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' | sudo tee -a /etc/profile
source /etc/profile

# Verify the installation
go version
echo "golang installation successful. "

