#!/bin/sh

# eg25-manager claims the gpios
sudo systemctl stop eg25-manager || sudo service eg25-manager stop

PINEMODEL=$((cat /proc/device-tree/model) | cut -c18-22)

PINE10NAME="(1.0)"
PINE11NAME="(1.1)"
PINE12NAME="(1.2)"

[ $PINEMODEL == $PINE10NAME ] && PC4_RESET=68
[ $PINEMODEL == $PINE11NAME ] && PC4_RESET=68
[ $PINEMODEL == $PINE12NAME ] && PC4_RESET=68

echo "Detected PinePhone version $PINEMODEL, using pin $PC4_RESET as reset"

# If PC4_RESET is not exported, export it
[ ! -d /sys/class/gpio/gpio$PC4_RESET ] && printf $PC4_RESET > /sys/class/gpio/export

printf out > /sys/class/gpio/gpio$PC4_RESET/direction

printf 1 > /sys/class/gpio/gpio$PC4_RESET/value
sleep 0.5
printf 0 > /sys/class/gpio/gpio$PC4_RESET/value
