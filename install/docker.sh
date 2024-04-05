#!/bin/bash

# update mirror repostiory at 2024/04/05
mirror_repostiory="{
  "registry-mirrors":
    [
      "dockerproxy.com",
      "mirror.gcr.io",
      "mirror.baidubce.com",
      "registry.hub.docker.com",
      "registry-1.docker.io",
      "docker.io"
  ]
}"

sudo apt-get -y install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable docker.service
sudo systemctl enable containerd.service

if [ "$role_docker" == "y" ]; then
  sudo groupadd docker
  sudo usermod -aG docker $USER
  echo "user $USER added to docker group"
  echo "you need reboot system to take effect"
fi
if ["$mirror_docker" == "y" ]; then
  echo "$mirror_repostiory" > /etc/docker/daemon.json
fi
