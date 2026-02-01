#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Введите пароль ${NOCOLOR}и нажмите ${RED}Enter!"
sleep 1s
echo "${YELLOW}Незакрывайте идёт обновление системы!!"
sudo apt -y update
sudo apt -y upgrade
sudo apt-get -f install
sudo apt -y autoclean 
sudo apt autoremove
echo "${YELLOW}Операция обновления и очистки завершена!!"
echo "${NOCOLOR}Всё хокей работаем дальше!!"
sleep 3s
