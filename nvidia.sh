#!/bin/bash
wget https://developer.download.nvidia.com/compute/nvidia-driver/580.178.04/local_installers/nvidia-driver-local-repo-debian12-580.178.04_1.0-1_amd64.deb
sudo dpkg -i nvidia-driver-local-repo-debian12-580.178.04_1.0-1_amd64.deb
sudo cp /var/nvidia-driver-local-repo-debian12-580.178.04/nvidia-driver-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get install -y nvidia-open-580
sudo apt-get install -y cuda-drivers-580