#!/bin/sh

GPIO=/sys/class/gpio
PIN=/sys/class/gpio/gpio
PB3_PWRKEY=35
#359
PL7_PWR=34
PC4_RESET=68
PH8_DISABLE=232
PH7_WAKEUP=231

printf $PL7_PWR > $GPIO/export
printf $PC4_RESET > $GPIO/export
printf $PH7_WAKEUP > $GPIO/export
printf $PH8_DISABLE > $GPIO/export
printf $PB3_PWRKEY > $GPIO/export

printf out > $PIN$PH8_DISABLE/direction
printf out > $PIN$PH7_WAKEUP/direction
printf out > $PIN$PC4_RESET/direction
printf out > $PIN$PL7_PWR/direction
printf out > $PIN$PB3_PWRKEY/direction

printf 0 > $PIN$PH8_DISABLE/value
printf 0 > $PIN$PH7_WAKEUP/value
printf 0 > $PIN$PC4_RESET/value

printf 1 > $PIN$PL7_PWR/value
sleep 0.1
printf 1 > $PIN$PB3_PWRKEY/value
sleep 0.2
printf 0 > $PIN$PB3_PWRKEY/value
