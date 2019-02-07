; ======== Taking in a number and displaying ascii on vdu =======
Main:
	IN  00			; Take in an input
	MOV CL, C0		; Move C0 into CL (top left of VDU)

FirstDigit:
	PUSH	AL		; Push the input to the Stack
	AND	AL, F0		; Split the Binary and take only the right 4 digits
	DIV     AL, 10
	ADD	AL, 30		; Add 30 (Gives the number in the table)
	MOV 	[CL], AL	; Move AL into position CL (Position in VDU)
	INC CL			; Increment CL
	POP	AL		; Pop AL (resets AL to the original input)

SecondDigit:
	AND	AL, 0F		; Split the Binary and take only the left 4 digits
	ADD	AL, 30		; Add 90 (Gives the number in the table)
	MOV	[CL], AL	; Move AL into position CL (Position in VDU)	

End:
	END