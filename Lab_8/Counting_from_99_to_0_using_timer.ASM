; ====== Counting from 99 to 0 with timer ==============
Setup:
	JMP	Main
	DB	40

Main:
	MOV	AL,	01	; Reset SSD
	OUT	02
	MOV	AL,	00
	OUT	02

MOV CL, 50
RESET_DL:
    MOV DL, 60                	; Move DL to position A0 (Right side)
    CMP CL, 5A                	; Cmp CL with position 9A
    JNZ PUSH_TO_SSD             ; IF CL is not at 9A jump to JUMPY
    JMP END                    	; Else jump to END

INCREMENT_CL:                   ; Incrementation Left side (Decrementation number)
    INC CL                    	; Increment CL
    JMP RESET_DL                ; Jump to JUMP

PUSH_TO_SSD:
    MOV AL, [CL]                ; Move CL/DL to register AL to output
    OUT 02                   	; Pushes to Seven Segment Display
    MOV AL, [DL]
    OUT 02
    JMP INTR_ENABLER

INCREMENT_DL:
    INC DL
    CMP DL,6A                	; CMP DL to end of numbers
    JNZ PUSH_TO_SSD             ; IF DL is not AA jump to JUMPY
    JMP INCREMENT_CL		; ELSE jump to INCY

INTR_ENABLER:                 	; ENABLING INTERUPTS 
    STI                    	; Initiate timer
    JMP LOOP

LOOP:
	JMP LOOP		; Timer interrupt
	ORG 40			; Once finished jump to origin 30
	POP BL			; Pop of the stack
	CLI			; Close the interrupt timer
	JMP INCREMENT_DL		

TABLE:
	ORG 50
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

	ORG 60
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

END:
    END