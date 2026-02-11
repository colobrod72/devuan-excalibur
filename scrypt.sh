#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Введите пароль ${NOCOLOR}и нажмите ${RED}Enter!"
echo "${YELLOW}Скрипт начинает работу ${NOCOLOR}хорошего дня ${RED}Вперёд!"
sleep 3s
echo "${YELLOW}Незакрывайте идёт установка пакетов!!"
sudo cp debian.list /etc/apt/sources.list.d/
sudo apt -y update
echo "${YELLOW}Операция обновления и очистки завершена!!"
echo "${NOCOLOR}Всё хокей работаем дальше!!"
sleep 2s
sudo apt install -y linux-headers-$(dpkg --print-architecture) awesome xserver-xorg xinit lightdm lxrandr lxpolkit polkitd pkexec network-manager-gnome xbindkeys xxkb xdotool rofi dunst feh lxappearance network-manager-applet redshift thunar thunar-archive-plugin thunar-volman gvfs dialog mtools cifs-utils unzip pavucontrol pulsemixer pamixer pipewire-pulse acpi acpid flameshot qimgv xdg-user-dirs-gtk suckless-tools eza curl pkgconf awesome-extra awesome-doc gparted synaptic nitrogen geany geany-common bleachbit lxrandr terminology lxterminal compton neowofetch mousepad grub-customizer cmus
echo "${YELLOW}Пакеты загрузились ${NOCOLOR}Работаем дальше ${RED}Хокей приятной работы!!"
sleep 4s
cp -r /home/zx/devuan-excalibur/awesome /home/zx/.config
echo "${YELLOW}Перезагружаемся!!"
sleep 2s

