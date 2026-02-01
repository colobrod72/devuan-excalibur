#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Введите пароль ${NOCOLOR}и нажмите ${RED}Enter!!!"
sudo sh -c "echo 1 >/proc/sys/vm/drop_caches"
sleep 2s
echo "${YELLOW}Незакрывайте идёт очистка кеша памяти!!!"
sudo sh -c "echo 2 >/proc/sys/vm/drop_caches"
sleep 2s
sudo sh -c "echo 3 >/proc/sys/vm/drop_caches"
sleep 2s
sudo swapoff -a
sleep 1s
echo "${YELLOW}Операция очистки кеша памяти завершена!!!"
echo "${NOCOLOR}Приятного дня и хорошей работы!"
sleep 5s

