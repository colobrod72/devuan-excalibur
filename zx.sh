#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -y xserver-xorg xinit lightdm lxrandr lxpolkit terminology lxterminal polkitd linux-headers-$(dpkg --print-architecture) nvidia-kernel-dkms nvidia-driver firmware-misc-nonfree thunar pluma geany geany-common