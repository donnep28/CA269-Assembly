; ========== Counting from 0 to 99 ===============
TABLE:
	ORG 80
	DB CE ; IS FOR 9
	DB FE ; IS FOR 8
	DB CA ; IS FOR 7
	DB 7C ; IS FOR 6
	DB DC ; IS FOR 5
	DB 4E ; IS FOR 4
	DB 9E ; IS FOR 3
	DB B6 ; IS FOR 2
	DB 0A ; IS FOR 1
	DB FA ; IS FOR 0

	ORG 90
	DB CF ; IS FOR 9
	DB FF ; IS FOR 8
	DB CB ; IS FOR 7
	DB 7D ; IS FOR 6
	DB DD ; IS FOR 5
	DB 4F ; IS FOR 4
	DB 9F ; IS FOR 3
	DB B7 ; IS FOR 2
	DB 0B ; IS FOR 1
	DB FB ; IS FOR 0


ORG 00			; Originate 00
MOV CL, 89		; Set CL to 89

RESET_DL:
    MOV DL, 99		; Set DL to 99
    CMP CL, 7F		; Compare CL to 7F
    JNZ PUSH_TO_SSD	; If its not 7F jump to PUSH_TO_SSD
    JMP END		; Else jump to END

INCREMENT_CL:
    DEC CL		; Decrement CL
    JMP RESET_DL	; Jump to RESET_DL

PUSH_TO_SSD:
    MOV AL, [CL]	; Move position CL to AL
    OUT 02		; Push out to SSD
    MOV AL, [DL]	; Move position DL to AL
    OUT 02		; Push out to SSD
    DEC DL		; Decrement DL
    CMP DL, 8F		; Compare DL to 8F
    JNZ PUSH_TO_SSD	; If it is not 9A PUSH_TO_SSD
    JMP INCREMENT_CL	; Else jump to INCREMENT_CL

END:
    END