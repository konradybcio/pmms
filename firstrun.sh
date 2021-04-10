touch .firstrun_done

ALARM=$(sed '3q;d' /etc/os-release | cut -c4-100)
[ $ALARM == "archarm" ] && echo "Detected Arch Linux ARM" && ./scripts/setup_arch.sh

cd tools/mkbootimg
make

