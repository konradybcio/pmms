#!/bin/sh

PINEMODEL=$((cat /proc/device-tree/model) | cut -c18-22)

PINE10NAME="(1.0)"
PINE11NAME="(1.1)"
PINE12NAME="(1.2)"

[ $PINEMODEL == $PINE10NAME ] && PC4_RESET=68 && PB3_PWRKEY=35 && PH7_WAKEUP=231 && PH8_DISABLE=232 && PL7_PWR=358
[ $PINEMODEL == $PINE11NAME ] && PC4_RESET=68 && PB3_PWRKEY=35 && PH7_WAKEUP=231 && PH8_DISABLE=232 && PL7_PWR=358
[ $PINEMODEL == $PINE12NAME ] && PC4_RESET=68 && PB3_PWRKEY=35 && PH7_WAKEUP=231 && PH8_DISABLE=232 && PL7_PWR=34

echo "Detected PinePhone version $PINEMODEL"
echo "Using pin $PC4_RESET as reset"
echo "Using pin $PB3_PWRKEY as pwrkey"
echo "Using pin $PH7_WAKEUP as wakeup"
echo "Using pin $PH8_DISABLE as disable"

# Export GPIOs if needed
[ ! -d /sys/class/gpio/gpio$PL7_PWR ] && printf $PL7_PWR > /sys/class/gpio/export
[ ! -d /sys/class/gpio/gpio$PC4_RESET ] && printf $PC4_RESET > /sys/class/gpio/export
[ ! -d /sys/class/gpio/gpio$PH7_WAKEUP ] && printf $PH7_WAKEUP > /sys/class/gpio/export
[ ! -d /sys/class/gpio/gpio$PH8_DISABLE ] && printf $PH8_DISABLE > /sys/class/gpio/export
[ ! -d /sys/class/gpio/gpio$PB3_PWRKEY ] && printf $PB3_PWRKEY > /sys/class/gpio/export

printf out > /sys/class/gpio/gpio$PH8_DISABLE/direction
printf out > /sys/class/gpio/gpio$PH7_WAKEUP/direction
printf out > /sys/class/gpio/gpio$PC4_RESET/direction
printf out > /sys/class/gpio/gpio$PL7_PWR/direction
printf out > /sys/class/gpio/gpio$PB3_PWRKEY/direction

printf 0 > /sys/class/gpio/gpio$PH8_DISABLE/value
printf 0 > /sys/class/gpio/gpio$PH7_WAKEUP/value
printf 0 > /sys/class/gpio/gpio$PC4_RESET/value

printf 1 > /sys/class/gpio/gpio$PL7_PWR/value
sleep 0.1
printf 1 > /sys/class/gpio/gpio$PB3_PWRKEY/value
sleep 0.2
printf 0 > /sys/class/gpio/gpio$PB3_PWRKEY/value
