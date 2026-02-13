#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "
 +-+-+-+-+-+-+-+-+ 
 |C|o|l|o|b|r|o|d|7|2| 
 +-+-+-+-+-+-+-+-+-+-+-+-+-+ 
 |a|w|e|s|o|m|e|w|m| |s|e|t|u|p|  
 +-+-+-+-+-+-+-+-+-+-+-+-+-+                                                                            
"
sleep 2s
mkdir /home/zx/.config
cp -r awesome /home/zx/.config
sudo apt update -y
sudo apt upgrade -y
sudo apt autoremove -y
sleep 1s
echo "${YELLOW}Продолжаем установку ${NOCOLOR}Работаем дальше"
sleep 2s
sudo apt install -y  linux-headers-$(dpkg --print-architecture) awesome xserver-xorg xinit lightdm lxrandr lxpolkit polkitd pkexec network-manager-gnome rofi dunst feh redshift lxappearance network-manager-applet thunar thunar-archive-plugin pavucontrol pulsemixer pamixer pipewire-pulse flameshot xdg-user-dirs-gtk pkgconf awesome-extra awesome-doc pluma bleachbit terminology lxterminal neowofetch mousepad
echo "${YELLOW}Грузим дальше!!"
sleep 2s
echo "${YELLOW}Пакеты загрузились ${NOCOLOR}Хокей ${RED}Приятной работы!! ${YELLOW}Перезагружаемся!!"
sleep 3s
