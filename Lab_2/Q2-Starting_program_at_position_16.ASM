
;==================== Starting at Position 16 ======================

	jmp progStart  ;Jump to memory location of program start
	org 16         ;Tell assembler to start putting code at 16
progstart:             ;This label will represent location 16
	clo            ;close unwanted windows
	mov Al,0       ;copy a 0 into al register
	add Al,01      ; add 01 to Al register and store it in AL
	end            ;Program ends