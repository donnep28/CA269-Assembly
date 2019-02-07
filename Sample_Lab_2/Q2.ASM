;---Procedure to Add all the odd numbers in table---

ORG 80		
DB 03
DB 01
DB 04
DB 06
DB 09
DB 3F
DB 2A

ORG 50		;IF ODD
MOV DL,0
MOV DL,[AL]
ADD CL,DL
INC AL
RET

ORG 60		;IF EVEN
INC AL
RET    		;its even so do nothing except move next number


ORG 00
MOV AL,80	;start of table
MOV BL,86	;end of table

START:
    MOV DL,0
    MOV DL,[AL]	;Setting DL to first value 
    MOD DL,2	;Checking odd or even
    JNZ ODD
    JMP EVEN

ODD:
    CALL 50
    CMP AL,BL	;Checking is it finished check
    JZ ENDY
    JMP START

EVEN:
    CALL 60
    CMP AL,BL
    JZ ENDY
    JMP START


ENDY:
    END