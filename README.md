# MgdZynq
Gasoline / diesel ECU based on Zynq SoC


## How to build

cd to /linux/mxdmdg/

Add petalinux scripts to path

`source ~/xilinx/petalinux/settings.sh`

Import hardware description:

`petalinux-config --get-hw-description ../../vivado/mxdmdg/`

run petalinux config commands

`petalinux-config -c --silentconfig  rootfs` --silentconfig is recommended only when no chagnes are needed

`petalinux-config -c uboot` (if needed)

`petalinux-config -c kernel` (if needed)

`petalinux-build`

To create boot image files run 

``./make_BOOT.BIN.sh``

## Flashing image

Mount properly formatted SD card and run:

copy boot partition data:

`cp BOOT.BIN image.ub boot.scr /media/mat/boot/`

copy and unpack image:

`sudo dd if=rootfs.ext4 of=/dev/sda2`
`udo dd if=rootfs.ext4 of=/media/mat/4c22ba36-6789-4d4d-bd7d-4840fb57ee67/`
`sudo tar -xzvf rootfs.tar.gz -C /media/mat/4c22ba36-6789-4d4d-bd7d-4840fb57ee67/`
Unmount card

`umount /media/mat/boot | umount /media/mat/4445de9e-1777-4426-b2d4-ae9baaaa6910`

## Export SDK
To create Yocto SDK run 

```petalinux-build && petalinux-build --sdk && petalinux-package --sysroot```

sdk directory in images/linux will be created.