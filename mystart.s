b reset
b reset
b reset
b reset
b reset
b reset
b reset
b reset

reset:
    bl gpio_out
    bl led2_on
    mov r0,r1
    mov r1,r2
    mov r2,r3
    mov r3,r4
    mov r4,r5

1:
    b 1b @b:往回（已经运行过的）跳转 f:往前（后面的语句）跳转

gpio_out:
	@LED out_mode
	ldr r11,=0xe0200340
	ldr r12,=0x11110000
	str r12,[r11]
    @output high
	ldr r11,=0xe0200344
	ldr r12,=0x000000f0
	str r12,[r11]

	@beep GPD0_0 close beep,input mode
	ldr r11,=0xe02000a0
	ldr r12,=0x00000000
	str r12,[r11]

	mov pc,lr




