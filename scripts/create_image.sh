./scripts/dtbTool --version=3 -o dt.img dtb && \
python3 ./tools/mkbootimg \
--header_version 2 \
--kernel zImage \
--ramdisk ./prebuilts/initrd-debug \
--dtb dt.img \
--cmdline "PMOS_NO_OUTPUT_REDIRECT rootfstype=ramfs root=/dev/ram0" \
--base 0x80000000 \
--kernel_offset 0x8000 \
--ramdisk_offset 0x1600000 \
--dtb_offset 0x2000000 \
--tags_offset 0x1f00000 \
--pagesize 2048 \
-o boot.img
