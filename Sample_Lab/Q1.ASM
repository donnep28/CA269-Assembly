
;========== Converting Upper to Lower and Lower to upper =========

ORG C0				; Originate at position C0
DB 48				; Put 'H' into position C0 (48 is hex for H)
DB 65				; Put 'e' into position C0 (65 is hex for e)
DB 4C				; Put 'L' into position C0 (4C is hex for L)
DB 6C				; Put 'l' into position C0 (6C is hex for l)
DB 4F				; Put 'O' into position C0 (4F is hex for O)
DB 77				; Put 'w' into position C0 (77 is hex for w)
DB 4F				; Put 'O' into position C0 (4F is hex for O)
DB 72				; Put 'r' into position C0 (72 is hex for r)
DB 4C				; Put 'L' into position C0 (4C is hex for L)
DB 44				; Put 'D' into position C0 (44 is hex for D)
ORG 00				; Originate at position 00

MOV AL, A			; Move 9 into AL (9 is length of string)
MOV CL, C0			; Move C0 into CL

LOOP:	
	MOV BL, [CL]		; Move positon CL into BL
	CMP BL, 5B           	; if the answer is  jump to upper_to_lower
	JS C_UPPER_TO_LOWER  	; Jump to c_upper_to_lower
	JMP C_LOWER_TO_UPPER  	; Jump to c_lower_to_upper

C_UPPER_TO_LOWER:
	MOV DL, [CL]		; Move position CL onto DL
	ADD DL, 20 		; ADD 20 for DL (Convert Upper case to Lower case)
	MOV [CL], DL		; Move DL to position CL
	INC CL			; Increment CL
	DEC AL			; Decrement AL
	JNZ LOOP		; Jump not while AL zero to Loop
	JMP END			; Jump to END

C_LOWER_TO_UPPER:
	MOV DL, [CL]		; Move position CL onto DL
	SUB DL, 20 		; Subtract 20 for DL (Convert Upper case to Lower case)
	MOV [CL], DL		; Move DL to position CL
	INC CL			; Increment CL
	DEC AL			; Decrement AL
	JNZ LOOP		; Jump not while AL zero to Loop
	JMP END			; Jump to END

	
END:
	END