#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Продолжаем установку ${NOCOLOR}Работаем дальше"
sleep 2s
sudo apt install -y  linux-headers-$(dpkg --print-architecture) awesome xserver-xorg xinit lxrandr lxpolkit polkitd pkexec network-manager-gnome xxkb rofi dunst feh redshift lxappearance network-manager-applet thunar thunar-archive-plugin thunar-volman pavucontrol pulsemixer pamixer pipewire-pulse flameshot xdg-user-dirs-gtk pkgconf awesome-extra awesome-doc gparted synaptic nitrogen geany geany-common bleachbit lxrandr terminology lxterminal neowofetch mousepad lightdm grub-customizer
echo "${YELLOW}Грузим дальше!!"
sleep 2s

