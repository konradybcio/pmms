./scripts/dtbTool --version=3 -o dt.img dtb && \
./tools/mkbootimg/mkbootimg \
--kernel zImage \
--ramdisk ./prebuilts/initrd-debug \
--base 0x80000000 \
--dt dt.img \
-o boot.img \
--cmdline "PMOS_NO_OUTPUT_REDIRECT" \
--tags-addr 0x81E00000
