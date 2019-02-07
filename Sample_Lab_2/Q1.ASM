; ===== Alternating 0 and 1 in VDU using timer =======
ORG 80			; Originate at 80
DB 30			; Add 30 (ascii for 0)
DB 31			; Add 31 (ascii for 1)

ORG 00			; Originate at 00
	JMP MAINCODE	; Jmp to MAINCODE
	DB 4A		; Store 4A into db 

MAINCODE:
	STI		; Initiate interrupts

MOV CL, C0		; Move C0 into register CL (C0 is top left of vdu)
ADD_0:
	MOV BL, [80]	; Move BL to position 80 (start of the DBs)
	MOV [CL], BL	; Move BL into positon CL (move bl into vdu)
	CMP CL, FF	; Compare CL to FF, (if CL has reached the bottom right of the VDU)
	JZ END		; If it is then jump to END
	INC CL		; Else increment CL
	JMP ENABLER	; Jump to Enabler (enabling the interrupt)

ADD_1:
	MOV DL, [81]	; Move postion 81 into DL
	MOV [CL], DL	; Move DL into Position CL (Adds DL to the VDU
	CMP CL, FF	; Compare CL to FF, (if CL has reached the bottom right of the VDU)	
	JZ END		; If it is then jump to END
	INC CL		; Else increment CL
	JMP ENABLER	; Jump to Enabler (enabling the interrupt)

ENABLER:
	STI		; Allow intterrupts
	JMP LOOP	; Jump to LOOP

LOOP:
	INC AL		; Counts for 5 seconds by using an infinte loop
	JMP LOOP
	ORG 4A		; Jump to originate 4A
	CLI		; Close intterrupts
	POP AL		; Pop AL
	PUSH CL		; Push CL to the stack
	POP DL		; Pop to DL
	MOD DL, 2	; Check to see if the last number on the VDU was even or not
	JZ ADD_0	; Jump to ADD_0
	JMP ADD_1	; Jump to ADD_1

END:
	END

	
