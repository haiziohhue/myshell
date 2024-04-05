#!/bin/bash
echo "Starting Node.js environment installation..."
sudo apt-get install -y nvm
nvm install $version_node
if "$install_pnpm" == "y"; then
    sudo npm i -g pnpm
    pnpm -v
fi
if "$install_yarn" == "y"; then
    sudo npm i -g yarn
    yarn -v
fi
if "$mirror_npm" == "y"; then
    npm config set registry https://registry.npmmirror.com
echo "Node.js environment installation completed."