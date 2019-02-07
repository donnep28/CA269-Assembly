Setup:
	JMP	Main		; Jump to main		
	DB	50		; Timer interrupt set at 12 
	DB	20		; Keyboard interrupt set at 20

Main:
	MOV CL, C0
	MOV BL, 7C
	MOV DL, 2F
	STI			; Initiate interrupts
	JMP LOOP

ORG 50
LOOP:
	MOV [CL], BL
	MOV [CL], DL
	JMP LOOP		; Timer Interrupt

KEYBOARD:
	ORG 20			; Originate at 20
	CLI			; Close Interrupts
	IN 07			; Take in keyboard interrupt
	MOV [CL], AL
	INC CL
	STI			; Initialise interrupts
	IRET			; Return interrupt

End:
	END