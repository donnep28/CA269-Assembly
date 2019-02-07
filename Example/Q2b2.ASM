JMP START
    DB 13

START:
    IN 08
    PUSH AL
    POP DL
    SUB DL, 30
    JMP CYCLE

ORG 13
CYCLE:
    CMP DL, 00
    JNZ CLEAR
    JMP END

CLEAR:
    MOV AL, 01
    OUT 02

MAIN:
    MOV AL, 0
    IN 08
    CMP AL, 31
    JS MAIN
    CMP AL, 39
    JNS MAIN
    DEC DL
    ADD AL, 60
    PUSH AL
    POP CL


DISPLAY:
    MOV AL, [CL]
    OUT 02
    JMP MAINCODE


ORG 60

MAINCODE:
    STI

LOOP:                        ; This is the interrupt LOOP
    JMP LOOP

IRET

TABLE:
    ORG 90

    DB FB ; IS FOR 0
    DB 0B ; IS FOR 1
    DB B7 ; IS FOR 2
    DB 9F ; IS FOR 3
    DB 4F ; IS FOR 4
    DB DD ; IS FOR 5
    DB 7D ; IS FOR 6
    DB CB ; IS FOR 7
    DB FF ; IS FOR 8
    DB CF ; IS FOR 9

ORG 50
END:
    END