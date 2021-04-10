[ ! -f .firstrun_done ] && ./firstrun.sh

sudo ./scripts/reset_modem.sh && ./scripts/create_image.sh && sudo fastboot boot boot.img && sleep 33 && ./scripts/telnet.sh
