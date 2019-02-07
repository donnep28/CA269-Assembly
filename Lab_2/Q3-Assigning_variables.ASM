
;==================== Assigning Variables ======================

	JMP progStart ;Jump Instruction pointer to program start
	DB 20	      ;Put a 20 after the jump instruction
	DB 21	      ;Followed by a 21
	DB 22	      ;Followed by a 22
	DB 23	      ;Followed by a 23
	ORG 16	      ;Origin of program starts at 16
progStart:	      ;The program starts
	CLO           ;Close all previous programs
	MOV AL,0      ;Move 0 to AL register
	ADD AL,01     ;Add 01 to AL register
	END	      ;End of Program