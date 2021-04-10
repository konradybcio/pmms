/*
 * Written by igem, 2020 ;)
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int ac, char* av[])
{
	if (ac != 2) {
		printf("Usage: unlock <serial>\nUse AT+QADBKEY? to get the serial number.\n");
		exit(1);
	}

	char salt[128];
	snprintf(salt, sizeof salt, "$1$%s$", av[1]);
	
	char *code = crypt("SH_adb_quectel", salt);
	code += 12;
	code[16] = 0;

	printf("AT+QADBKEY=\"%s\"\n", code);
	printf("AT+QCFG=\"usbcfg\",0x2C7C,0x125,1,1,1,1,1,1,0\n\n");
	printf("To disable ADB, run: (beware that modem will not be able to enter sleep with ADB enabled!!)\n");
	printf("AT+QCFG=\"usbcfg\",0x2C7C,0x125,1,1,1,1,1,0,0\n");
	return 0;
}

