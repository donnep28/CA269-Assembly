MOV BL, 1
MOV CL, 0

doMod:
	MOV AL, 31
	PUSH AL
	POP DL
	MOD AL, BL
	JZ countZeros
	JNZ increaseDivisor

doModLast:
	PUSH DL
	POP AL
	MOD AL, BL
	JZ countZerosLast

countZerosLast:
	INC CL
	JMP end

countZeros:
	INC CL
	JMP increaseDivisor


increaseDivisor:
	INC BL
	CMP DL, BL
	JZ doModlast
	JNZ continue
continue:
	JMP doMod

end:
	CMP CL, 2
	JZ realEnd
	JNZ fakeEnd

realEnd:
	PUSH DL
	POP AL
	JMP finalend

fakeEnd:
	MOV AL, FF
	JMP finalend

finalend:
	END