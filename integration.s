	AREA MYDATA, DATA, READONLY
		
YELLOW	EQU  	0xFFE0
BLUE 	EQU  	0x001F
BLACK	EQU   	0x0000	
GREEN 	EQU  	0x07E0	
MAGENTA EQU 	0xF81F
RED  	EQU  	0xF800	


	IMPORT ArrowSelect	
	IMPORT UpArrow	
	
	AREA INTEGRATION, CODE, READONLY
		
	;============================	
	IMPORT DRAW_BEN10_SCREEN
	IMPORT DRAW_HOME_SCREEN
	IMPORT DRAW_INTRO_SCREEN
	IMPORT BOX_EXPANSION	
	IMPORT GET_READINGS
	IMPORT HOME_INTERFACE
	IMPORT ALARM_INTERFACE	
	IMPORT STOPWATCH_INTERFACE
	IMPORT THEMES_INTERFACE
	IMPORT GAMES_INTERFACE	
	IMPORT DRAW_NUMBERS
	IMPORT GET_TEMPRATURE_AND_HUMIDITY_VALUE
	IMPORT SNAKE_GAME	
	IMPORT SNAKE_GAME_HIGHER_LEVEL	
	IMPORT DRAW_ICON_OPS

	IMPORT DRAW_RECTANGLE_FILLED		
 
		
		
	;===================================
	EXPORT HELLO_SCREEN
	EXPORT OMNITREX_SCREEN
	EXPORT HOME_SCREEN
	EXPORT SCREEN_MAIN	
	EXPORT SCREEN_ALARM
	EXPORT SCREEN_STOPWATCH
	EXPORT SCREEN_THEMES	
	EXPORT SCREEN_GAMES	
			
;=====================================HELLO_SCREEN=======================================	

HELLO_SCREEN FUNCTION
	PUSH{LR}
	BL DRAW_INTRO_SCREEN
	BL BOX_EXPANSION
	POP{PC}
	ENDFUNC
;=======================================OMNITREX_SCREEN======================================	
OMNITREX_SCREEN	FUNCTION
	PUSH{LR}
	BL DRAW_BEN10_SCREEN
LOOP_OMNITREX_SCREEN	
	
	BL GET_READINGS
	CMP R5, #16
	BEQ RET_OMNITREX_SCREEN
	B LOOP_OMNITREX_SCREEN
	
RET_OMNITREX_SCREEN	
	MOV R5, #0
	
	POP{PC}
	ENDFUNC
	
;========================================HOME_SCREEN=====================================	
HOME_SCREEN FUNCTION
	PUSH{LR}
	
	BL DRAW_HOME_SCREEN

	POP{PC}
	ENDFUNC
;=======================================SCREEN_MAIN======================================
SCREEN_MAIN FUNCTION
	PUSH{LR}
	
	BL HOME_INTERFACE
	
	BL HANDLE_TEMP_SENSOR
	
LOOP_SCREEN_MAIN	;==========================MAIN======================
	
	BL GET_READINGS
	CMP R5, #0
	BNE RET_SCREEN_MAIN
	
	B LOOP_SCREEN_MAIN ;=========================MAIN====================
	
RET_SCREEN_MAIN
	POP{PC}
	
	
	ENDFUNC
;=====================================SCREEN_ALARM========================================
SCREEN_ALARM FUNCTION
	PUSH{LR}
	
	BL ALARM_INTERFACE
	
LOOP_SCREEN_ALARM	;=======================MAIN======================
	
	
	BL GET_READINGS
	CMP R5, #0
	BNE RET_SCREEN_ALARM
	
	
	
	B LOOP_SCREEN_ALARM;=======================MAIN=====================
	
RET_SCREEN_ALARM
	POP{PC}

	
	ENDFUNC
	
;=========================SCREEN_STOPWATCH==========================
SCREEN_STOPWATCH FUNCTION
	PUSH{LR}
	BL STOPWATCH_INTERFACE
LOOP_SCREEN_STOPWATCH	;========================MAIN====================
	
	BL GET_READINGS
	CMP R5, #0
	BNE RET_SCREEN_STOPWATCH
	
	
	
	
	
	B LOOP_SCREEN_STOPWATCH ;=========================MAIN================
	
RET_SCREEN_STOPWATCH	

	POP{PC}
	ENDFUNC
;==================================SCREEN_THEMES====================================	
SCREEN_THEMES FUNCTION
	PUSH{LR}
	BL THEMES_INTERFACE  ;FUNCTION TO DRAW ICONS
	
	MOV R9, R10
	MOV R0, #40
	MOV R1, #150
	MOV R3, #80
	MOV R4, #153
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV R10, R9
	
LOOP_SCREEN_THEMES	;========================MAIN====================
	
	BL GET_READINGS
	
	CMP R5, #2
	BEQ THEME1_SELECTION_ASSIST
	
	CMP R5, #0
	BNE RET_SCREEN_THEMES_ASSIST
	B LOOP_SCREEN_THEMES
	;////////////////////////////////////////////////////
THEME1_SELECTION_ASSIST	

	MOV R0, #40
	MOV R1, #150
	MOV R3, #80
	MOV R4, #153
	;LDR R10,=GREEN
	BL DRAW_RECTANGLE_FILLED
	
	;FIX COORDINATES
	MOV R9, R10
	MOV R0, #151
	MOV R1, #180
	MOV R3, #311
	MOV R4, #205
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV R10, R9
	
	;FIX COORDINATES
	MOV R9, R10
	MOV R0, #161           ; X Position
	MOV R1, #185          ; Y Position
	LDR R6, =UpArrow   ; Bitmap Address
    LDR R10,=BLUE
	BL DRAW_ICON_OPS
	MOV R10, R9
	
THEME1_SELECTION
	
	MOV R5, #0
	BL GET_READINGS
	CMP R5, #16 
	BEQ CONVEFRT_TO_THEME1
	CMP R5, #2
	BEQ THEME2_SELECTION_ASSIST
	CMP R5, #1
	BEQ LOOP_SCREEN_THEMES

	B THEME1_SELECTION
RET_SCREEN_THEMES_ASSIST
	B RET_SCREEN_THEMES

THEME2_SELECTION_ASSIST
	MOV R9, R10
	MOV R0, #151
	MOV R1, #180
	MOV R3, #311
	MOV R4, #205
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV R10, R9
	
	MOV R9, R10
	MOV R0, #221           ; X Position
	MOV R1, #185          ; Y Position
	LDR R6, =UpArrow   ; Bitmap Address
    LDR R10, =BLUE
	BL DRAW_ICON_OPS
	
	MOV R10, R9
THEME2_SELECTION

	MOV R5, #0
	BL GET_READINGS
	CMP R5, #16 
	BEQ CONVEFRT_TO_THEME2
	CMP R5, #2
	BEQ THEME3_SELECTION_ASSIST
	CMP R5, #1
	BEQ THEME1_SELECTION_ASSIST

	B THEME2_SELECTION
	
THEME3_SELECTION_ASSIST

	MOV R9, R10
	MOV R0, #151
	MOV R1, #180
	MOV R3, #311
	MOV R4, #205
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV R10, R9
	
	MOV R9, R10
	MOV R0, #281           ; X Position
	MOV R1, #185          ; Y Position
	LDR R6, =UpArrow   ; Bitmap Address
    LDR R10, =BLUE
	BL DRAW_ICON_OPS
	MOV R10, R9
THEME3_SELECTION

	MOV R5, #0
	BL GET_READINGS
	CMP R5, #16 
	BEQ CONVEFRT_TO_THEME3
	CMP R5, #1
	BEQ THEME2_SELECTION_ASSIST

	B THEME3_SELECTION
	
CONVEFRT_TO_THEME1
	MOV R5, #0
	LDR R10,=GREEN
	MOV R1, #1

	B  RET_SCREEN_THEMES

CONVEFRT_TO_THEME2
	MOV R5, #0
	LDR R10,=RED
	MOV R1, #1

	B  RET_SCREEN_THEMES
	
CONVEFRT_TO_THEME3
	MOV R5, #0
	LDR R10,=MAGENTA
	MOV R1, #1

	B  RET_SCREEN_THEMES
	
	
	
	B LOOP_SCREEN_THEMES ;=========================MAIN================
	
RET_SCREEN_THEMES	

	POP{PC}
	ENDFUNC
	
;=======================================SCREEN_GAMES=============================================	
SCREEN_GAMES FUNCTION
	PUSH{LR}
ret_FROM_GAME
	
	BL GAMES_INTERFACE
	MOV R9, R10
	MOV R0, #40
	MOV R1, #150
	MOV R3, #80
	MOV R4, #153
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV R10, R9
	
	
	
LOOP_SCREEN_GAMES	;========================MAIN====================
	
	BL GET_READINGS
	
;==========================================================	
	CMP R5, #2
	BEQ GAME1_SELECTION_ASSIST
;=========================
	CMP R5, #0
	BNE RET_SCREEN_GAMES
	
	B LOOP_SCREEN_GAMES
	
GAME1_SELECTION_ASSIST	

	MOV R0, #40
	MOV R1, #150
	MOV R3, #80
	MOV R4, #153
	;LDR R10,=GREEN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R9, R10
	MOV R0, #128
	MOV R1, #142
	MOV R3, #148
	MOV R4, #202
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV R10, R9
	
	MOV R9, R10
	MOV R0, #128           ; X Position
	MOV R1, #142          ; Y Position
	LDR R6, =ArrowSelect   ; Bitmap Address
    LDR R10,=BLUE
	BL DRAW_ICON_OPS
	MOV R10, R9

GAME1_SELECTION
	
	MOV R5, #0
	BL GET_READINGS
	CMP R5, #16 
	BEQ SNAKE_GAME1_START
	CMP R5, #8
	BEQ GAME2_SELECTION_ASSIST
	CMP R5, #1
	BEQ LOOP_SCREEN_GAMES

	B GAME1_SELECTION

GAME2_SELECTION_ASSIST

	MOV R9, R10
	MOV R0, #128
	MOV R1, #142
	MOV R3, #148
	MOV R4, #202
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV R10, R9
	
	MOV R9, R10
	MOV R0, #128           ; X Position
	MOV R1, #182          ; Y Position
	LDR R6, =ArrowSelect   ; Bitmap Address
    LDR R10, =BLUE
	BL DRAW_ICON_OPS
	MOV R10, R9
	
GAME2_SELECTION

	MOV R5, #0
	BL GET_READINGS
	CMP R5, #16 
	BEQ SNAKE_GAME2_START
	CMP R5, #4
	BEQ GAME1_SELECTION_ASSIST
	CMP R5, #1
	BEQ LOOP_SCREEN_GAMES

	B GAME2_SELECTION
	
;==========================================================	
SNAKE_GAME1_START
	MOV R5, #0
	BL SNAKE_GAME
	BL DRAW_HOME_SCREEN
	B  ret_FROM_GAME

SNAKE_GAME2_START
	MOV R5, #0
	BL SNAKE_GAME_HIGHER_LEVEL
	BL DRAW_HOME_SCREEN
	B  ret_FROM_GAME
	
	
	B LOOP_SCREEN_GAMES ;=========================MAIN================
	
RET_SCREEN_GAMES	

	POP{PC}
	ENDFUNC
	






;=============================================================================
HANDLE_TEMP_SENSOR FUNCTION
	PUSH{R0-R12, LR}
	BL GET_TEMPRATURE_AND_HUMIDITY_VALUE	
	
	;R12 HUMADITY
	;R11 TEMP
	
;		MOV R0, #200           ; X Position
;	MOV R1, #75          ; Y Position
;	LDR R6, =Char3	; Bitmap Address
;	LDR R10, =GREEN
;	BL DRAW_CHAR
	
	MOV R7, #0
	AND R7, R11, #0X0F
	LDR R10 ,=YELLOW 
	MOV R0, #220
	MOV R1, #75
	BL DRAW_NUMBERS
	
	LSR R11, #4
	
	MOV R7, #0
	AND R7, R11, #0X0F
	LDR R10 ,=YELLOW 
	MOV R0, #200
	MOV R1, #75
	BL DRAW_NUMBERS
	
	
	
	MOV R7, #0
	AND R7, R12, #0X0F
	LDR R10 ,=BLUE 
	MOV R0, #220
	MOV R1, #125
	BL DRAW_NUMBERS
	
	LSR R12, #4
	
	MOV R7, #0
	AND R7, R12, #0X0F
	LDR R10 ,=BLUE 
	MOV R0, #200
	MOV R1, #125
	BL DRAW_NUMBERS


	POP{R0-R12, PC}
	ENDFUNC




;=============================================================================


	END