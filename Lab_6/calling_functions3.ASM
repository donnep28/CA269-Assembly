; ======= Calling Functions =======
MOV AL, C0
MOV BL, 4A

CALL 50

MOV AL, FF

CALL 50

HALT

ORG 50
MOV [AL], BL
RET


END