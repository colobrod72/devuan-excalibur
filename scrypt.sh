#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Введите пароль ${NOCOLOR}и нажмите ${RED}Enter!"
echo "${YELLOW}Скрипт начинает работу ${NOCOLOR}хорошего дня ${RED}Вперёд!"
sleep 2s
echo "${YELLOW}Незакрывайте идёт установка пакетов!!"
sleep 2s
sudo cp debian.list /etc/apt/sources.list.d/
sudo apt -y update
sudo apt -y upgrade
sudo apt-get -f install
sudo apt -y autoclean 
sudo apt -y autoremove
echo "${YELLOW}Операция обновления и очистки завершена!!"
echo "${NOCOLOR}Незабудь зайти в sudoers и поправить root!!"
sleep 3s


