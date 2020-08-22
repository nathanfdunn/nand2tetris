
		@256
		D=A
		@SP
		M=D
	
		// Initialize other segments to invalid
		@1
		D=-A
		@LCL
		M=D
	
		@2
		D=-A
		@ARG
		M=D
	
		@3
		D=-A
		@THIS
		M=D
	
		@4
		D=-A
		@THAT
		M=D
		// End bootstrap
	// Command(type='call', raw='Sys.init', arg=0, source='SYSTEM')
			// push returnaddr
			@RET6ee8a709ab4d4b04a1772f58745993c5
			D=A
			
@SP
A=M
M=D
@SP
M=M+1


			// push LCL
			@LCL
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@ARG
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@THIS
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@THAT
			D=M
			
@SP
A=M
M=D
@SP
M=M+1



			// LCL = SP
			@SP
			D=M
			@LCL
			M=D

			// ARG = SP-n-5
			@SP
			D=M
			@0
			D=D-A
			@5
			D=D-A

			@ARG
			M=D

			@Sys.init
			0;JMP

			(RET6ee8a709ab4d4b04a1772f58745993c5)

			// Command(type='function', raw='Sys.init', arg=0, source='Sys')
			(Sys.init)		// Need to disambiguate?
			// Command(type='pushc', raw='push constant 4', arg=4, source='Sys')
				@4
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='call', raw='Main.fibonacci', arg=1, source='Sys')
			// push returnaddr
			@RETe27240ef49ca4b119200360a8befa9bc
			D=A
			
@SP
A=M
M=D
@SP
M=M+1


			// push LCL
			@LCL
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@ARG
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@THIS
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@THAT
			D=M
			
@SP
A=M
M=D
@SP
M=M+1



			// LCL = SP
			@SP
			D=M
			@LCL
			M=D

			// ARG = SP-n-5
			@SP
			D=M
			@1
			D=D-A
			@5
			D=D-A

			@ARG
			M=D

			@Main.fibonacci
			0;JMP

			(RETe27240ef49ca4b119200360a8befa9bc)

			// Command(type='label', raw='label WHILE', arg='WHILE', source='Sys')
(WHILE)
// Command(type='goto', raw='goto WHILE', arg='WHILE', source='Sys')
			@WHILE
			0;JMP
			// Command(type='function', raw='Main.fibonacci', arg=0, source='Main')
			(Main.fibonacci)		// Need to disambiguate?
			// Command(type='push', raw='argument', arg=0, source='Main')
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

					// Command(type='pushc', raw='push constant 2', arg=2, source='Main')
				@2
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='cmp', raw='lt', arg=None, source='Main')
				
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

				D=M-D		// Comparison

				M=-1		// Set to true
				@ADDRff8c4e54f5b94a68837f28ee08835691	
				D;JLT		// If we're correct, skip the part where we set to false

				@SP
				A=M
				M=0

				(ADDRff8c4e54f5b94a68837f28ee08835691)

				
@SP
M=M+1

				// Command(type='if-goto', raw='if-goto IF_TRUE', arg='IF_TRUE', source='Main')
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			@IF_TRUE
			D;JNE
			// Command(type='goto', raw='goto IF_FALSE', arg='IF_FALSE', source='Main')
			@IF_FALSE
			0;JMP
			// Command(type='label', raw='label IF_TRUE', arg='IF_TRUE', source='Main')
(IF_TRUE)
// Command(type='push', raw='argument', arg=0, source='Main')
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

					// Command(type='return', raw='return', arg=None, source='Main')
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

			// Command(type='label', raw='label IF_FALSE', arg='IF_FALSE', source='Main')
(IF_FALSE)
// Command(type='push', raw='argument', arg=0, source='Main')
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

					// Command(type='pushc', raw='push constant 2', arg=2, source='Main')
				@2
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='arith', raw='sub', arg=None, source='Main')
			
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

			// Command(type='call', raw='Main.fibonacci', arg=1, source='Main')
			// push returnaddr
			@RET9b1298b88be1456fa97e8db1624d13bf
			D=A
			
@SP
A=M
M=D
@SP
M=M+1


			// push LCL
			@LCL
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@ARG
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@THIS
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@THAT
			D=M
			
@SP
A=M
M=D
@SP
M=M+1



			// LCL = SP
			@SP
			D=M
			@LCL
			M=D

			// ARG = SP-n-5
			@SP
			D=M
			@1
			D=D-A
			@5
			D=D-A

			@ARG
			M=D

			@Main.fibonacci
			0;JMP

			(RET9b1298b88be1456fa97e8db1624d13bf)

			// Command(type='push', raw='argument', arg=0, source='Main')
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

					// Command(type='pushc', raw='push constant 1', arg=1, source='Main')
				@1
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='arith', raw='sub', arg=None, source='Main')
			
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

			// Command(type='call', raw='Main.fibonacci', arg=1, source='Main')
			// push returnaddr
			@RETaa212a3e79cb4506acfd5902476ba92d
			D=A
			
@SP
A=M
M=D
@SP
M=M+1


			// push LCL
			@LCL
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@ARG
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@THIS
			D=M
			
@SP
A=M
M=D
@SP
M=M+1


			@THAT
			D=M
			
@SP
A=M
M=D
@SP
M=M+1



			// LCL = SP
			@SP
			D=M
			@LCL
			M=D

			// ARG = SP-n-5
			@SP
			D=M
			@1
			D=D-A
			@5
			D=D-A

			@ARG
			M=D

			@Main.fibonacci
			0;JMP

			(RETaa212a3e79cb4506acfd5902476ba92d)

			// Command(type='arith', raw='add', arg=None, source='Main')
			
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

			// Command(type='return', raw='return', arg=None, source='Main')
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

			