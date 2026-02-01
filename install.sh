#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Через пару секунд ${NOCOLOR}начнём загружать ${RED}Удачи!"
sleep 2s
echo "${RED}Незакрывайте ${YELLOW}идёт загрузка и ${NOCOLOR}обновление системы!!"
sleep 2s
sudo mkdir /etc/apt/sources.list.d
sleep 1s
sudo cp -r freia.list /etc/apt/sources.list.d && sudo apt update
sudo apt install -y xserver-xorg xinit lightdm mousepad wget curl connman connman-gtk gparted synaptic compton nitrogen tint2 openbox obconf obsession linux-headers-$(dpkg --print-architecture) lxrandr lxappearance bleachbit terminology thunar pkexec lxpolkit polkitd xxkb conky-std mintstick neowofetch xarchiver thunar-archive-plugin ufw
sleep 1s
echo "${YELLOW}Не спешите ${RED}идёт установка ${NOCOLOR}примерно 8 сек.!!"
sudo apt autoclean && sudo apt autoremove -y
sleep 1s
mkdir /home/zx/.config && mkdir /home/zx/.config/openbox
sleep 1s
cd openbox
sudo cp clear.sh /opt && sudo cp log.sh /opt && sudo cp upgrade.sh /opt
sleep 1s
cp autostart /home/zx/.config/openbox && cp menu.xml /home/zx/.config/openbox && cp rc.xml /home/zx/.config/openbox && cp as.txt /home/zx && cp ReadMe.txt /home/zx
sleep 1s
mv conkyrc /home/zx/.conkyrc && mv xxkbrc /home/zx/.xxkbrc && mv xrandr.sh /home/zx/.xrandr.sh && cd ..
sleep 1s
cd themes && tar xvzf Xeno-gtk.tar.gz && sudo cp -r Xeno-gtk /usr/share/themes && cd ..
sleep 1s
cd icons && tar xvf Fekete.tar.xz && sudo cp -r Fekete /usr/share/icons && cd ..
sleep 1s
tar -xvzf systemback2.tar.gz
sleep 1s
cd /home/zx/excalibur && sudo cp -r oboi /usr/share/images
sleep 1s
sudo chmod 5755 /usr/lib/policykit-1/polkit-agent-helper-1
sleep 1s && wget https://launchpad.net/veracrypt/trunk/1.26.24/+download/veracrypt-1.26.24-Debian-13-amd64.deb && wget https://github.com/session-foundation/session-desktop/releases/download/v1.17.7/session-desktop-linux-x86_64-1.17.7.AppImage && wget https://github.com/OneKeyHQ/app-monorepo/releases/download/v5.20.0/OneKey-Wallet-5.20.0-linux-x86_64.AppImage
echo "${YELLOW}Операция обновления и установки ${RED}завершена!!"
sleep 1s
echo "${RED}Скрипт работу завершил, ${YELLOW}закроется через 8 секунд!!"
sleep 1s
echo "${YELLOW}Всё хокей ${NOCOLOR}работаем дальше!!"
sleep 6s
sudo reboot -f

