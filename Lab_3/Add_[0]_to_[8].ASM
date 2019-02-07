
;==================== Add From Position 0 to Position 8 ======================

MOV CL,08		; Move 08 into CL
MOV AL,00		; Move 00 into AL

LOOP:
	MOV BL,[CL]	; Move position CL into BL
	ADD AL, BL	; Add AL and BL (store in AL)
	DEC CL		; Decrement CL
	JNZ LOOP	; Jump while CL is not zero
	END