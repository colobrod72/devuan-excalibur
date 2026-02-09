#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt autoclean -y
sudo apt autoremove -y
sudo apt install -y xserver-xorg xinit lightdm lxrandr lxpolkit terminology lxterminal polkitd linux-headers-$(dpkg --print-architecture) nvidia-kernel-dkms nvidia-driver firmware-misc-nonfree thunar pluma geany geany-common rofi dunst feh lxappearance network-manager-applet redshift thunar thunar-archive-plugin thunar-volman pavucontrol pulsemixer pamixer pipewire-pulse lua-language-server picom compton fonts-recommended fonts-font-awesome fonts-terminus synaptic gparted pkexec mousepad bleachbit obsession nitrogen network-manager-gnome
