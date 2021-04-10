#!/bin/sh

GPIO=/sys/class/gpio
PIN=/sys/class/gpio/gpio
PL7_PWR=359
PB3_PWRKEY=35

printf $PL7_PWR > $GPIO/export
printf $PB3_PWRKEY > $GPIO/export

printf out > $PIN$PL7_PWR/direction
printf out > $PIN$PB3_PWRKEY/direction

printf 1 > $PIN$PB3_PWRKEY/value
sleep 0.5
printf 0 > $PIN$PB3_PWRKEY/value
#printf 0 > $PIN$PL7_PWR/value
