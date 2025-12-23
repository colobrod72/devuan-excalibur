#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Введите пароль ${NOCOLOR}и нажмите ${RED}Enter!"
sleep 1s
echo "${YELLOW}Незакрывайте идёт установка пакетов!!"
sudo apt -y install lsof rsync ecryptfs-utils cryptsetup
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install linux-headers-$(dpkg --print-architecture)
sudo apt -y update
sudo apt -y upgrade
sudo apt -y install lightdm mousepad connman connman-gtk thunar terminology gparted neowofetch openbox obconf obsession tint2 compton lxappearance lxrandr bleachbit synaptic xxkb conky-std nitrogen
sudo apt -y update
sudo apt -y upgrade
sudo apt-get -f install
sudo apt -y autoclean 
sudo apt autoremove
echo "${YELLOW}Операция обновления и очистки завершена!!"
echo "${NOCOLOR}Всё хокей работаем дальше!!"
sleep 2s
