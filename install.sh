#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Через пару секунд ${NOCOLOR}начнём загружать ${RED}Удачи!"
sleep 2s
echo "${RED}Незакрывайте ${YELLOW}идёт загрузка и ${NOCOLOR}обновление системы!!"
echo "${YELLOW}Не спешите ${RED}идёт установка ${NOCOLOR}примерно 8 сек.!!"
mkdir /home/as/.config && mkdir /home/as/.config/openbox
sleep 1s
cd openbox
sudo cp clear.sh /opt && sudo cp log.sh /opt && sudo cp upgrade.sh /opt
sleep 1s
cp autostart /home/as/.config/openbox && cp menu.xml /home/as/.config/openbox && cp rc.xml /home/as/.config/openbox && cp as.txt /home/as && cp ReadMe.txt /home/as
sleep 1s
mv conkyrc /home/as/.conkyrc && mv xxkbrc /home/as/.xxkbrc && mv xrandr.sh /home/as/.xrandr.sh && cd ..
sleep 1s
sudo chmod 5755 /usr/lib/policykit-1/polkit-agent-helper-1
sleep 1s && wget https://launchpad.net/veracrypt/trunk/1.26.24/+download/veracrypt-1.26.24-Debian-13-amd64.deb
echo "${YELLOW}Операция обновления и установки ${RED}завершена!!"
sleep 1s
echo "${RED}Скрипт работу завершил, ${YELLOW}закроется через 8 секунд!!"
sleep 1s
echo "${YELLOW}Всё хокей ${NOCOLOR}работаем дальше!!"
sleep 6s

