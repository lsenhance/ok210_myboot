#!/bin/bash

arm-linux-as mystart.s -o mystart.o
arm-linux-as mylowlevel_init.s -o mylowlevel_init.o
arm-linux-ld -T myboot.lds -o myboot mystart.o mylowlevel_init.o
arm-linux-objcopy -O binary myboot myboot.bin

rm u-boot.16k
./mkv210 myboot.bin u-boot.16k
