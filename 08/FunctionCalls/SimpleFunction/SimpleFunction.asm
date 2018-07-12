// Command(type='function', raw='SimpleFunction.SimpleFunction.test', arg=2)
			(SimpleFunction.SimpleFunction.test)
			
				@SP
				A=M
				M=0				// Initialize to zero
				
@SP
M=M+1

				
				@SP
				A=M
				M=0				// Initialize to zero
				
@SP
M=M+1

				// Command(type='push', raw='local', arg=0)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@LCL
				D=M
				@0
				A=D+A 			// Now we have the index

				D=M 			// Save the value

@SP
A=M
M=D
@SP
M=M+1

				// Command(type='push', raw='local', arg=1)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@LCL
				D=M
				@1
				A=D+A 			// Now we have the index

				D=M 			// Save the value

@SP
A=M
M=D
@SP
M=M+1

				// Command(type='arith', raw='add', arg=None)
			
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

			M=M+D
			
@SP
M=M+1

			// Command(type='bool', raw='not', arg=None)
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			M=!D
			
@SP
M=M+1

			// Command(type='push', raw='argument', arg=0)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@ARG
				D=M
				@0
				A=D+A 			// Now we have the index

				D=M 			// Save the value

@SP
A=M
M=D
@SP
M=M+1

				// Command(type='arith', raw='add', arg=None)
			
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

			M=M+D
			
@SP
M=M+1

			// Command(type='push', raw='argument', arg=1)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@ARG
				D=M
				@1
				A=D+A 			// Now we have the index

				D=M 			// Save the value

@SP
A=M
M=D
@SP
M=M+1

				// Command(type='arith', raw='sub', arg=None)
			
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

			M=M-D
			
@SP
M=M+1

			// Command(type='return', raw='return', arg=None)
			@LCL
			D=M
			@R15	//FRAME
			M=D

			// write stack to arg[0]
			// set sp to arg
			@SP 		// D = value at top of stack
			A=M-1
			D=M

			@ARG 		// arg[0] = D
			A=M
			M=D

			@ARG 		// D = &arg[0]
			D=M

			@SP 		// SP = ARG+1
			M=D+1


			@R15
			AM=M-1		// FRAME - 1
			D=M

			@THAT
			M=D


			@R15
			AM=M-1		// FRAME - 2
			D=M

			@THIS
			M=D


			@R15
			AM=M-1		// FRAME - 3
			D=M

			@ARG
			M=D

			@R15
			AM=M-1		// FRAME - 4
			D=M

			@LCL
			M=D


			@R15
			AM=M-1		// FRAME - 5
			A=M

			0;JMP

			