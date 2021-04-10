#!/bin/sh

# eg25-manager claims the gpios
# the script assumes a manjaro CE PP
sudo systemctl stop eg25-manager || sudo service eg25-manager stop

GPIO=/sys/class/gpio
PIN=/sys/class/gpio/gpio
PC4_RESET=68

printf $PC4_RESET > $GPIO/export

printf out > $PIN$PC4_RESET/direction

printf 1 > $PIN$PC4_RESET/value
sleep 0.5
printf 0 > $PIN$PC4_RESET/value
