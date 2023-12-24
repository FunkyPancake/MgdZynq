#!/bin/bash -eu

petalinux-package \
    --boot \
    --force \
    --fsbl ./images/linux/zynq_fsbl.elf \
    --fpga ./project-spec/hw-description/mxdmdg_wrapper.bit \
    --u-boot

