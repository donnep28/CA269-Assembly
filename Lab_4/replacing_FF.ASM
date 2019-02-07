
; =========== replacing FF ========

MOV AL, BF		; Move BF into register AL
MOV BL, FF		; Move FF into register BL
LOOP:
	MOV[AL],BL	; Move BL into position AL 
	DEC AL		; Decrement AL
	JNZ LOOP	; While AL is not zero

END