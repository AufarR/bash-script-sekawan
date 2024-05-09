#!/bin/bash

# Set timezone to Asia/Jakarta
timedatectl set-timezone Asia/Jakarta

# Update package lists & upgrade packages
export NEEDRESTART_MODE=a # full unattended mode
apt update -y && apt upgrade -y

# Install git, curl, zip, python3, python3-pip
apt install -y curl zip python3 python3-pip

# Install docker

## Add Docker's official GPG key:
apt install -y ca-certificates
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

## Add docker repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update -y

## Install docker package
apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
