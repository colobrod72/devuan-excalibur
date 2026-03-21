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
cd themes && tar xvzf Xeno-gtk.tar.gz && sudo cp -r Xeno-gtk /usr/share/themes && cd ..
cd icons && tar xvf Fekete.tar.xz && sudo cp -r Fekete /usr/share/icons && cd ..
sleep 1s
sudo pacman -Syu
echo "${YELLOW}Продолжаем установку ${NOCOLOR}Работаем дальше"
sleep 2s
sudo pacman -S awesome xorg xorg-xinit lxrandr polkit rofi dunst feh redshift lxappearance network-manager-applet thunar thunar-archive-plugin xarchiver pavucontrol pulsemixer pamixer pipewire-pulse flameshot xdg-user-dirs-gtk pkgconf geany bleachbit terminology fastfetch mousepad
echo "${YELLOW}Грузим дальше!!"
sleep 2s
echo "${YELLOW}Пакеты загрузились ${NOCOLOR}Хокей ${RED}Приятной работы!! ${YELLOW}Перезагружаемся!!"
