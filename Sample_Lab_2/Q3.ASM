; ======== Taking in a digit and displaying ascii on SSD ==========
Clear:
	MOV	AL, 00		; Reset the Left side of SSD
	OUT 	02		; Out to SSD
	MOV	AL, 01		; Reset the Right side of SSD
	OUT 	02		; Out to SSD

Main:
	IN  	00		; Take in an input
	CMP 	AL, 71
	JZ 	End
	CMP 	AL, 30
	JS 	Main
	CMP 	AL, 3A
	JNS 	Main

FirstDigit:
	PUSH	AL		; Push the input to the Stack
	AND	AL, F0		; Split the Binary and take only the right 4 digits
	DIV	AL, 10
	ADD	AL, 50		; Add 90 (Gives the number in the table)
	MOV	AL, [AL]	; Move position AL to AL
	SUB	AL, 01		; Subtract 1 from AL
	OUT	02		; Send to the SSD
	POP	AL		; Pop AL (resets AL to the original input)

SecondDigit:
	AND	AL, 0F		; Split the Binary and take only the left 4 digits
	ADD	AL, 50		; Add 90 (Gives the number in the table)
	MOV	AL, [AL]	; Move position AL to AL	
	OUT	02		; Send to the SSD
	JMP	Main

Table:
	ORG	50
	DB	FB 		; 0
	DB	0B 		; 1
	DB	B7 		; 2
	DB	9F 		; 3
	DB	4F 		; 4
	DB	DD 		; 5
	DB	FD 		; 6
	DB	CB 		; 7
	DB	FF 		; 8
	DB	CF 		; 9
	DB	EE 		; A
	DB	7C 		; B
	DB	F0 		; C
	DB	3E 		; D
	DB	F4 		; E
	DB	E4 		; F

End:
	END