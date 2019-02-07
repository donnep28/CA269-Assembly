
;==================== Print Hello World in VDU ======================

clo           	;close other windows
	Mov AL,48     ;mov H in AL, 48 = ASCII 'H'
	Mov [C0],AL   ;put AL into position C0
	Mov AL,65     ;move e into AL,65 = ASCII 'e'
	Mov [C1],AL   ;put AL into position C0
	Mov AL,6C     ;mov l in AL,6C= ASCII 'l'
	Mov [C2],AL   ;put AL into position C2
	Mov [C3],AL   ;put AL into position C3
	Mov AL,6F     ;move 0 into AL,6F = ASCII '0'
	Mov [C4],AL   ;put AL into position C4

	Mov AL,77     ;mov w in AL, 77 = ASCII 'w'
	Mov [C6],AL   ;put AL into position C6
	Mov AL,6F     ;move 0 into AL,6F = ASCII '0'
	Mov [C7],AL   ;put AL into position C7
	Mov AL,72     ;move r into AL,72 = ASCII 'r'
	Mov [C8],AL   ;put AL into position C8
	Mov AL,6C     ;mov l in AL,6C= ASCII 'l'
	Mov [C9],AL   ;put AL into position C9
	Mov AL,64     ;mov d in AL,64= ASCII 'l'
	Mov [CA],AL   ;put AL into position CA
End
