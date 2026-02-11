#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Продолжаем установку ${NOCOLOR}Работаем дальше"
sleep 2s
cp -r /home/zx/devuan-excalibur/awesome /home/zx/.config
echo "${YELLOW}Грузим дальше!!"
sleep 2s
sudo apt install -y  linux-headers-$(dpkg --print-architecture) awesome xserver-xorg xinit lightdm lxrandr lxpolkit polkitd pkexec network-manager-gnome xbindkeys xxkb xdotool rofi dunst feh lxappearance network-manager-applet redshift thunar thunar-archive-plugin thunar-volman gvfs dialog mtools cifs-utils unzip pavucontrol pulsemixer pamixer pipewire-pulse acpi acpid flameshot qimgv xdg-user-dirs-gtk suckless-tools eza cmake meson curl pkgconf awesome-extra awesome-doc gparted synaptic nitrogen geany geany-common bleachbit lxrandr terminology lxterminal compton neowofetch mousepad lightdm grub-customizer cmus
echo "${YELLOW}Пакеты загрузились ${NOCOLOR}Хокей ${RED}Приятной работы!! ${YELLOW}Перезагружаемся!!"
sleep 3s
