#!/bin/bash
echo "Starting Golang environment installation..."
cd /usr/src
url="https://golang.org/dl/go$version.linux-amd64.tar.gz"

wget -O go.tar.gz $url
sudo tar -C /usr/local -xzf go.tar.gz

$version_go $proxy_go $install_gotools
echo 'export GOROOT=/usr/local/go' | sudo tee -a /etc/profile

mkdir $HOME/go

echo "export GOPATH=$HOME/go" >>$CONFIG_FILE
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >>$CONFIG_FILE
echo "export GOROOT=/usr/local/go" >>$CONFIG_FILE
if "$proxy_go"== "y"; then
    echo "export GOPROXY=http://goproxy.cn" >>$CONFIG_FILE
fi

if "$install_gotools"=="y"; then
    go install golang.org/x/tools/cmd/goimports@latest
fi

echo "Golang environment installation completed."
