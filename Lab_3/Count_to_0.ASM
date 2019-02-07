
;==================== Count to 0 ======================

MOV CL,08		; Move 08 into CL

LOOP:
	DEC CL		; Decrement CL		
	JNZ LOOP	; While CL is not zero jump to LOOP
	END		
