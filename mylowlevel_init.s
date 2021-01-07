.global led2_on
led2_on:
	ldr r11,=0xe0200344
	ldr r12,[r11]
	bic r12,r12,#0x20
	str r12,[r11]

	mov pc,lr

