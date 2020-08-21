// Command(type='pushc', raw='push constant 17', arg=17)
				@17
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pushc', raw='push constant 17', arg=17)
				@17
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='cmp', raw='eq', arg=None)
				
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

				D=M-D		// Comparison

				M=-1		// Set to true
				@ADDRd1ec6560e4034e00b0edff76dfde60c4	
				D;JEQ		// If we're correct, skip the part where we set to false

				@SP
				A=M
				M=0

				(ADDRd1ec6560e4034e00b0edff76dfde60c4)

				
@SP
M=M+1

				// Command(type='pushc', raw='push constant 17', arg=17)
				@17
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pushc', raw='push constant 16', arg=16)
				@16
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='cmp', raw='eq', arg=None)
				
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

				D=M-D		// Comparison

				M=-1		// Set to true
				@ADDR017b032077e74d4ba603e88e2f216c0d	
				D;JEQ		// If we're correct, skip the part where we set to false

				@SP
				A=M
				M=0

				(ADDR017b032077e74d4ba603e88e2f216c0d)

				
@SP
M=M+1

				