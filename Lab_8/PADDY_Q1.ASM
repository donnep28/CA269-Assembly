Setup:
	JMP	Main
	DB	10

Main:
	MOV	AL,	01
	OUT	02
	MOV	AL,	00
	OUT	02
	STI

Loopo:
	JMP	Loopo

Count:
	CLI

	PUSH	AL
	DIV	AL,	0A
	ADD	AL,	3E
	MOV	AL,	[AL]
	SUB	AL,	1
	OUT	02
	POP	AL

	PUSH	AL
	MOD	AL,	0A
	ADD	AL,	3E
	MOV	AL,	[AL]
	OUT	02
	POP	AL

	DEC	AL
	CMP	AL,	FF
	JZ	End

	STI
	IRET

TableSetup:
	DB	FB	; 0
	DB	0B	; 1
	DB	B7	; 2
	DB	9F	; 3
	DB	4F	; 4
	DB	DD	; 5
	DB	FD	; 6
	DB	CB	; 7
	DB	FF	; 8
	DB	CF	; 9

End:
	END