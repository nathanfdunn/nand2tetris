// Keyboard register - 24576
// Screen start - 16384
// Screen end 24576 (+8192)


// Set fill color based on keyboard
// //TEST
// @24576
// M=1			// Dummy keyboard press
// //TEST


(TestKeyboard)
@24576
D=M
@FillWhite
D;JEQ



(FillBlack)
@16384
D=A
@1					// R1 will hold the current screen address
M=D

(FillBlackInner)
// Set RAM[R1] to black
@1
A=M
M=0
M=M-1

// Increment R1
D=A+1
@1
M=D

// Test if we are on the last pixel
// @1
// D=M
@24576
D=A-D
@TestKeyboard
D;JLE

@FillBlackInner
0;JMP



(FillWhite)
@16384
D=A
@1					// R1 will hold the current screen address
M=D

(FillWhiteInner)
// Set RAM[R1] to white
@1
A=M
M=0

// Increment R1
D=A+1
@1
M=D

// Test if we are on the last pixel
@1
D=M
@24576
D=A-D
@TestKeyboard
D;JLE

@FillWhiteInner
0;JMP
