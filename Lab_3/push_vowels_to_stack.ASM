
;==================== Push vowels to stack ======================

	ORG C0
	DB "AHIGOURE"
	ORG 0
	
	MOV AL, 8    ; 8 is the length of the string
	MOV CL, C0   ; Move C0 in to register CL

LOOP:
	MOV DL, [CL] ; Move memory location CL in to register DL
	INC CL

	CMP DL, 41   ; Compare if DL is ascii 41 (aka 'A')
	JZ PUSH_VOWEL    ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 45   ; Compare if DL is ascii 45 (aka 'E')
	JZ PUSH_VOWEL    ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 49   ; Compare if DL is ascii 49 (aka 'I')
	JZ PUSH_VOWEL    ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 4F   ; Compare if DL is ascii 4F (aka 'O')
	JZ PUSH_VOWEL    ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 55   ; Compare if DL is ascii 55 (aka 'U')
	JZ PUSH_VOWEL    ; If the comparison is TRUE we jump to other loop
	
	
	DEC AL       ; Bring AL down by 1 (incrementaion of the string)
	JNZ LOOP     ; JUMP while not zero
	JMP END       ; When it is zero jump to end

PUSH_VOWEL:
	PUSH DL ; Move 'Z' into position CL
	DEC AL
	JZ END
	JMP LOOP

END:
	END