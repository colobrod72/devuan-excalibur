#!/bin/bash
YELLOW='\033[1;33m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
echo "${YELLOW}Введите пароль ${NOCOLOR}и нажмите ${RED}Enter!!"
sudo truncate --size 0 /var/log/syslog
sleep 1s
echo "${YELLOW}Незакрывайте идёт очистка логов системы!!"
sudo truncate --size 0 /var/log/kern.log
sleep 1s
sudo truncate --size 0 /var/log/auth.log
sleep 1s
sudo truncate --size 0 /var/log/cron.log
sleep 1s
sudo truncate --size 0 /var/log/dpkg.log
sleep 1s
sudo truncate --size 0 /var/log/fontconfig.log
sleep 1s
sudo truncate --size 0 /var/log/slim.log
sleep 1s
sudo truncate --size 0 /var/log/user.log
sleep 1s
sudo truncate --size 0 /var/log/Xorg.0.log
sleep 1s
sudo truncate --size 0 /var/log/ufw.log
sleep 1s
sudo truncate --size 0 /var/log/alternatives.log
sleep 1s
sudo truncate --size 0 /var/log/boot.log
sleep 1s
sudo truncate --size 0 /var/log/faillog
sleep 1s
sudo truncate --size 0 /var/log/lastlog
sleep 1s
sudo truncate --size 0 /var/log/vbox-setup.log
echo "${YELLOW}Операция очистки логов системы завершена!!!"
echo "${NOCOLOR}Приятного дня и хорошей работы!"
sleep 5s













