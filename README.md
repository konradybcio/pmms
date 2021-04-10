# PinePhone Modem Mainline Suite (PMMS)

Hi, welcome to the PMMS (PinePhone Modem Mainline Suite)

It's a set of tools and scripts to make the development easier.



DO *NOT* use this if you you use your PinePhone as your main device.
This MAY damage the modem PERMANENTLY. No warranties!

-------------------------------------

To get mainline going on your modem:

Unlock the modem (instructions adapted from [xnux.eu](https://xnux.eu/devices/feature/modem-pp.html)):


```
# Open a console at the modem AT tty
picocom /dev/ttyUSB2 --baud 9600

# Get the ADB unlock key for your modem
# Save the output of this command.
AT+QADBKEY? [enter]

# Compile the tools/unlocker/unlocker.c
cc unlocker.c

# Generate the unlock key specific to your modem
./a.out <your key you just got>

# To unlock the modem, pass the first two commands from the unlocker [in the TTY]
AT+QADBKEY="<your unlock code>"
AT+QCFG="usbcfg",0x2C7C,0x125,1,1,1,1,1,1,0
```



If you're running this for the first time, run `./firstrun.sh`

If you're on a fresh Arch Linux ARM install, run `./scripts/setup_arch.sh`

Now, simply run `sudo ./qletsgo.sh` (or ./q[tab][enter] ;))

Should the modem boot, running `telnet 173.16.42.1` should drop you to an initrd shell.

Have fun!
