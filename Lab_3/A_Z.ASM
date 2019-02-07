
;==================== Print Alphabet in VDU ======================

MOV AL, C0		; Move C0 into AL
MOV BL, 41		; Move 41 into BL (41 = start of alphabet) 
MOV CL, 1A		; Move 1A into CL (1A = Length of Alphabet)

LOOP:
	MOV [AL],BL	; Move BL into Position AL
	INC AL		; Increment AL
	INC BL		; Increment BL
	DEC CL		; Decrement CL
	JNZ LOOP	; While CL is not zero jump to LOOP
	END

