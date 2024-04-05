#!/bin/bash
# Download and extract Go binary
cd /usr/src
wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz

# Set GOROOT and GOPATH environment variables
echo 'export GOROOT=/usr/local/go' | sudo tee -a /etc/profile
mkdir $HOME/go

# Verify the installation
echo "export GOPATH=$HOME/go" >> $CONFIG_FILE
echo "export GOPROXY=http://goproxy.cn" >> $CONFIG_FILE
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> $CONFIG_FILE
echo "export GOROOT=/usr/local/go" >> $CONFIG_FILE

echo "golang installation successful. "