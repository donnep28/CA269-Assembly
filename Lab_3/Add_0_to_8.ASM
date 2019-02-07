
;==================== Add from 0 to 8 ======================

	CLO       	;Close all other processes
	MOV CL,08 	;Move 08 to register CL
LOOP:             	;Begining of loop
	ADD AL,CL 	;Add register CL and AL
	DEC CL    	;Decrement  CL
	JNZ LOOP  	;Jump while not zero
	END       	;When it is zero end