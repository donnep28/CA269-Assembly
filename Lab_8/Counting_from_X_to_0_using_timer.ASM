; ====== Counting from X to 0 using keyboard interrupt ========
Setup:
	JMP	Main		; Jump to main		
	DB	0F		; Timer interrupt set at 12 
	DB	20		; Keyboard interrupt set at 20

Main:
	MOV	AL, 01		; Reset the Left number in SSD
	OUT	02		; Out to SSD
	MOV	AL, 00		; Reset the Right number in SSD
	OUT	02		; Out to SSD

	STI			; Initiate interrupts

Loopo:
	JMP Loopo		; Timer Interrupt

Number1:
	ORG 20			; Originate at 20
	CLI			; Close Interrupts

	IN 07			; Take in keyboard interrupt
	SUB AL, 30		; Take 30 from AL
	MUL AL, 0A		; Multiply AL by 10

	PUSH AL			; Push AL
	POP BL			; Pop to BL

	MOV AL, 40		; Move 40 into AL
	MOV [03], AL		; Move AL into position 03

	STI			; Initialise interrupts
	IRET			; Return interrupt

Number2:
	ORG 40			; Originate at 40
	CLI			; Close interrupts

	IN 07			; Take keyboard input
	SUB AL, 30		; Subtract 30
	ADD BL, AL		; Add AL to BL

	MOV AL, 60		; Move 60 to AL
	MOV [02], AL		; Move AL into position 02

	PUSH BL			; Push BL
	POP AL			; Pop to AL

	STI			; Initiate interrupts
	IRET			; Return

Count:
	ORG 60			; Originate at 60
	CLI			; Close interrupts

	PUSH AL			; Push AL to Stack
	DIV AL,	0A		; Divide AL by 10
	ADD AL,	90		; Add 90 to AL
	MOV AL,	[AL]		; Move position AL into AL
	SUB AL,	1		; Subtract 1 from AL 
	OUT 02			; Push to the SSD
	POP AL			; Pop to AL

	PUSH AL			; Push AL to stack
	MOD AL,	0A		; Mod AL by 10
	ADD AL,	90		; Add 90 to AL
	MOV AL,	[AL]		; Move position AL to AL
	OUT 02			; Out to SSD
	POP AL			; Pop AL

	DEC AL			; Decrement AL
	CMP AL,	FF		; Check to see if AL is FF
	JZ End			; If it is jump to END

	STI			; Initiate interrupt
	IRET			; Return 

TableSetup:
	ORG 90
	DB FB	; 0
	DB 0B	; 1
	DB B7	; 2
	DB 9F	; 3
	DB 4F	; 4
	DB DD	; 5
	DB 7D	; 6
	DB CB	; 7
	DB FF	; 8
	DB CF	; 9

End:
	END