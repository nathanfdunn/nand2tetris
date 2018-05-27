// Initialize R2 to 0
D=0
@2
M=D

// END if what's left of R0 is 0
@0
D=M
@100
D;JEQ

// Increase accumulator by R1 and decrement R0
	// Load up R1
@1			
D=M
	// Increase R2
@2
M=M+D
	// Decrement R0
@0
M=M-1

// Unconditionally jump to our loop criteria
@3
0;JMP
