
;==================== Putting 41 into position 41 ======================

MOV CL,40		; Move 40 into CL
MOV AL,40		; Move 40 into AL

LOOP:
	MOV [AL],CL	; Move CL into position AL
	INC AL		; Increment AL
	INC CL		; Increment CL
	CMP AL, 4A	; Compare AL to 4A (Position 4A)
	JS LOOP		; Jump if AL is smaller than 4A
	JMP END

END:
	END