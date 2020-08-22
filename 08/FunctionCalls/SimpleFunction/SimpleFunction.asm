
		// Sys.vm absent. Supressing call Sys.init 0 command
	
		// Compiled with -b flag
		// Relying on external stack pointer initialization
	// Command(type='function', raw='SimpleFunction.test', arg=2, source='SimpleFunction')
			(SimpleFunction.test)		// Need to disambiguate?
			
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

				// Command(type='push', raw='local', arg=0, source='SimpleFunction')
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

					// Command(type='push', raw='local', arg=1, source='SimpleFunction')
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

					// Command(type='arith', raw='add', arg=None, source='SimpleFunction')
			
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

			// Command(type='bool', raw='not', arg=None, source='SimpleFunction')
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			M=!D
			
@SP
M=M+1

			// Command(type='push', raw='argument', arg=0, source='SimpleFunction')
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

					// Command(type='arith', raw='add', arg=None, source='SimpleFunction')
			
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

			// Command(type='push', raw='argument', arg=1, source='SimpleFunction')
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

					// Command(type='arith', raw='sub', arg=None, source='SimpleFunction')
			
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

			// Command(type='return', raw='return', arg=None, source='SimpleFunction')
			@LCL
			D=M
			@R15	//FRAME
			M=D

			@5
			A=D-A
			D=M
			@MyRet
			M=D

			// write stack to arg[0]
			// set sp to arg
			@SP 		// D = value at top of stack
			//A=M-1
			AM=M-1		// REVISION
			D=M

			@ARG 		// arg[0] = D
			A=M
			M=D

			@ARG 		// D = &arg[0]
			D=M

			@SP 		// SP = ARG+1
			M=D+1


			@R15
			D=M
			D=D-1		// FRAME - 1
			A=D
			D=M
			@THAT
			M=D


			@R15
			D=M
			D=D-1
			D=D-1		// FRAME - 2
			A=D
			D=M
			@THIS
			M=D


			@R15
			D=M
			D=D-1
			D=D-1
			D=D-1		// FRAME - 3
			A=D
			D=M
			@ARG
			M=D


			@R15
			D=M
			D=D-1
			D=D-1
			D=D-1
			D=D-1		// FRAME - 4
			A=D
			D=M
			@LCL
			M=D


			@MyRet
			A=M

			0;JMP

			