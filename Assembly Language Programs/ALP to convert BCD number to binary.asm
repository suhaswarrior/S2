	AREA _BCD_TO_BINARY , CODE
	ENTRY
	LDR R0,= NUMBER
	MOV R1 , #10 ; Radix
	MOV R6 , #0
	MOV R2 , #4 ; No of Bytes
	
	ADD R0,R0,R2
	SUB R0,R0,#1
NEXT_BYTE
	LDRB R3 ,[R0]
	SUB R0 , R0 , #1
	AND R4 , R3 , #0xF0
	AND R5 ,R3, #0x0F
	
	LSR R4 , #4
	
	MUL R6,R1,R6
	ADD R6,R6,R4
	MUL R6,R1,R6
	ADD R6,R6,R5
	
	SUBS R2,R2,#1
	BNE NEXT_BYTE
	
STOP	B	STOP
NUMBER DCD 0x00000127
	END