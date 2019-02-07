
;==================== Replace vowels with Z ======================

	ORG C0
	DB "AEIOUBCU"
	ORG 0
	
	MOV AL, 8    ; 8 is the length of the string
	MOV BL, 5A   ; 5A is hex for 'Z'
	MOV CL, C0   ; Move C0 in to register CL

LOOP:
	MOV DL, [CL] ; Move memory location CL in to register DL

	CMP DL, 41   ; Compare if DL is ascii 41 (aka 'A')
	JZ A_TO_Z    ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 45   ; Compare if DL is ascii 45 (aka 'E')
	JZ A_TO_Z    ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 49   ; Compare if DL is ascii 49 (aka 'I')
	JZ A_TO_Z    ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 4F   ; Compare if DL is ascii 4F (aka 'O')
	JZ A_TO_Z    ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 55   ; Compare if DL is ascii 55 (aka 'U')
	JZ A_TO_Z    ; If the comparison is TRUE we jump to other loop
	
	INC CL       ; Increment postion CL by 1
	DEC AL       ; Bring AL down by 1 (incrementaion of the string)
	JNZ LOOP     ; JUMP while not zero
	JMP END       ; When it is zero jump to end

A_TO_Z:
	MOV [CL], BL ; Move 'Z' into position CL
	JMP LOOP

END:
	END