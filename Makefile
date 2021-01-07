CC:=arm-linux-gcc

.PHONY:all
all : myboot
	

myboot: mystart.o mylowlevel_init.o myboot.lds
	arm-linux-ld -T myboot.lds -o myboot mystart.o mylowlevel_init.o
	arm-linux-objcopy -O binary myboot myboot.bin
	./mkv210 myboot.bin myboot.16k

# mystart.o : mystart.s
# 	arm-linux-gcc -c mystart.s

# mylowlevel_init.o : mylowlevel_init.s
# 	arm-linux-gcc -c mylowlevel_init.s

# %.o : %.s
# 	arm-linux-gcc -c $<
%.o:%.s
	$(CC) -o $@ -c $<

.PHONY:mksd
mksd:
	sudo dd iflag=dsync oflag=dsync if=myboot.16k of=/dev/sdb seek=1

.PHONY:clean
clean:
	rm *.o myboot myboot.bin myboot.16k -f
