
; ============= Modulus Count Odd Values Example =========

DB A1 				; Add A1 into DB 
DB A2 				; Add A2 into DB
DB A3 				; Add A3 into DB
DB FF 				; Add FF into DB

MOV DL, 00			; Move 00 to DL
MOV CL, 00			; Move 00 to CL

MOV AL, 4			; Move 4 to AL (length of string)
CONTINUE:
	CMP AL, 0		; Compare AL with 0
	JNZ wasA		; While AL not 0 jump to wasA
	JMP FINISH		; JMP FINISH

wasA:
	DEC AL			; Decrement AL
	MOV BL, [DL]		; Move position DL to register BL
	INC DL			; Increment DL
	MOD BL,2		; Modulus BL by 2
	JZ CONTINUE		; If the modulus results in zero jump to CONTINUE
	JMP ODD			; Jump to ODD

ODD:
	INC CL			; Increment CL
	JMP CONTINUE		; Jump to CONTINUE
	
FINISH:
	END