
; ======== INPUTING NUMBERS AND MULTIPLYING THEM ========

FIRST_NUMBER:
	IN 00			; Input value
	CMP AL, 30		; Compare AL to 30 (hex for 0)
	JS FIRST_NUMBER		; If the value is smaller than 30 input is not valid
	CMP AL, 3A		; Compare AL to 39 (hex for value above 9) 
	JNS FIRST_NUMBER	; If the value is bigger then 9 input is not valid
	SUB AL, 30		; Subtract 30 from AL (leaves the initial number)
	PUSH AL			; Push AL to stack
	POP BL			; Pop from stack to BL
	JMP SECOND_NUMBER	; JMP to SECOND_NUMBER

SECOND_NUMBER:
	IN 00			; Input value
	CMP AL, 30		; Compare AL to 30 (hex for 0)
	JS SECOND_NUMBER	; If the value is smaller than 30 input is not valid
	CMP AL, 3A		; Compare AL to 39 (hex for value above 9)
	JNS SECOND_NUMBER	; If the value is bigger then 9 input is not valid
	JMP MUL_NUMBERS		; Jump to MUL_NUMBERS

MUL_NUMBERS:
	SUB AL, 30		; Subtract 30 from AL (leaves the initial number)
	MUL AL, BL		; Multiply AL and BL and leave answer in AL
	JMP END			; Jump END

END:
	END