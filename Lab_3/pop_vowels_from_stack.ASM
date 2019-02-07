
;==================== Pop vowels from stack ======================

	ORG C0
	DB "AHIGOURE"
	ORG 0
	
	MOV AL, 8    	; 8 is the length of the string
	MOV CL, C0   	; Move C0 in to register CL

LOOP:
	MOV DL, [CL] 	; Move memory location CL in to register DL
	INC CL		; Increment CL

	CMP DL, 41   	; Compare if DL is ascii 41 (aka 'A')
	JZ PUSH_VOWEL   ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 45   	; Compare if DL is ascii 45 (aka 'E')
	JZ PUSH_VOWEL   ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 49   	; Compare if DL is ascii 49 (aka 'I')
	JZ PUSH_VOWEL   ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 4F   	; Compare if DL is ascii 4F (aka 'O')
	JZ PUSH_VOWEL   ; If the comparison is TRUE we jump to other loop
	

	CMP DL, 55   	; Compare if DL is ascii 55 (aka 'U')
	JZ PUSH_VOWEL   ; If the comparison is TRUE we jump to other loop
	
	
	DEC AL       	; Bring AL down by 1 (incrementaion of the string)
	JNZ LOOP     	; JUMP while not zero
	JMP WHITE_SPACE

PUSH_VOWEL:
	PUSH DL      	; Move 'Z' into position CL
	DEC AL       	; Decrement AL
	JZ WHITE_SPACE  ; When zero jump to White space loop
	JMP LOOP     	; Jump to loop

WHITE_SPACE:
	MOV CL, C0   	; Reset the position of the VDU
	MOV AL, 08   	; Move 8 into AL (length of vdu string)
	MOV BL, 20   	; Move white space (' ') into BL (20 = Ascii value)
	JMP CLEAR_VDU  	; Jmp to clear VDU

CLEAR_VDU:
	MOV [CL], BL 	; Mov BL into position CL on VDU
	INC CL       	; Increment CL
	DEC AL       	; Decrement AL
	JNZ CLEAR_VDU  	; While AL is not zero jump to Clear_VDU
	MOV CL, C0   	; Move CL to position C0 (VDU)
	MOV AL, 5    	; Move 5 into AL register (length of POP)
	JMP POP_VOWEL  	; Jmp to POP_VOWEL

POP_VOWEL:
	POP BL       	; Pop to BL
	MOV [CL], BL  	; Move BL to position CL (in the VDU)
	INC CL       	; Increment CL
	DEC AL       	; Decrement AL from 5 to 0
	JNZ POP_VOWEL  	; Jump while not Zero to POP_VOWEL
	JMP END	     	; Jump to END
	

END:
	END