; ======= IS PRIME =======

MOV AL, 1f

CHECK_IS_PRIME:
	CMP AL, 0   ; Compare AL to number 0 (30 in hex)
	JZ END       ; If true jump to end as number is prime
	CMP AL, 1   ; Compare AL to number 1 (31 in hex)
	JZ END       ; If true jump to end as number is prime
	CMP AL, 2   ; Compare AL to number 2 (32 in hex)
	JZ END       ; If true jump to end as number is prime
	CMP AL, 3   ; Compare AL to number 3 (33 in hex)
	JZ END       ; If true jump to end as number is prime
	CMP AL, 5   ; Compare AL to number 5 (35 in hex)
	JZ END       ; If true jump to end as number is prime
	CMP AL, 7   ; Compare AL to number 7 (37 in hex)
	JZ END       ; If true jump to end as number is prime
	JMP MOD_VALUES

MOD_VALUES:
	PUSH AL    ; Push AL
	POP BL     ; Pop to BL (Taking the input and copying it to BL)
	MOD BL, 2   ; Mod BL by 2
	CMP BL, 0   ; Compare BL with 0
	JZ CHANGE_AL  ; If true jump to CHANGE_AL

	PUSH AL    ; Push AL
	POP BL     ; Pop to BL (Taking the input and copying it to BL)
	MOD BL, 3   ; Mod BL by 3
	CMP BL, 0   ; Compare BL with 0
	JZ CHANGE_AL  ; If true jump to CHANGE_AL

	PUSH AL    ; Push AL
	POP BL     ; Pop to BL (Taking the input and copying it to BL)
	MOD BL, 5   ; Mod BL by 5
	CMP BL, 0   ; Compare BL with 0
	JZ CHANGE_AL  ; If true jump to CHANGE_AL

	PUSH AL    ; Push AL
	POP BL     ; Pop to BL (Taking the input and copying it to BL)
	MOD BL, 7   ; Mod BL by 7
	CMP BL, 0   ; Compare BL with 0
	JZ CHANGE_AL  ; If true jump to CHANGE_AL
	JMP END

CHANGE_AL:
	MOV AL, FF  ; Move FF into AL
	JMP END

END:
	END