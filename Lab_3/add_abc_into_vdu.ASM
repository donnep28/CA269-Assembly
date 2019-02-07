
;==================== Add ABC into VDU ======================

MOV AL,41	; Add 41 into AL (Hex for A)
MOV [C0],AL	; Move AL into position C0 (C0 is VDU position 1)
MOV AL,42	; Add 42 into AL (Hex for B)
MOV [C1],AL	; Move AL into position C1 (C1 is VDU position 2)
MOV AL,43	; Add 43 into AL (Hex for C)
MOV [C2],AL	; Move AL into position C3 (C2 is VDU position 3)
END