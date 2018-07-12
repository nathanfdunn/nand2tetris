// Command(type='function', raw='Sys.Sys.init', arg=0)
			(Sys.Sys.init)
			// Command(type='pushc', raw='push constant 4', arg=4)
				@4
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='call', raw='Sys.Main.fibonacci', arg=1)
			// push returnaddr
			@RET86bdd3a81d3745deb41688fdc97b674a
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
			@5
			D=D-A
			@1
			D=D-A

			@ARG
			M=D

			@Sys.Main.fibonacci
			0;JMP

			(RET86bdd3a81d3745deb41688fdc97b674a)

			// Command(type='label', raw='label WHILE', arg='WHILE')
(WHILE)
// Command(type='goto', raw='goto WHILE', arg='WHILE')
			@WHILE
			0;JMP
			// Command(type='function', raw='Main.Main.fibonacci', arg=0)
			(Main.Main.fibonacci)
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

				// Command(type='pushc', raw='push constant 2', arg=2)
				@2
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='cmp', raw='lt', arg=None)
				
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

				D=M-D		// Comparison

				M=-1		// Set to true
				@ADDR608b477b6aed463c8ee9e727ac4a2d25	
				D;JLT		// If we're correct, skip the part where we set to false

				@SP
				A=M
				M=0

				(ADDR608b477b6aed463c8ee9e727ac4a2d25)

				
@SP
M=M+1

				// Command(type='if-goto', raw='if-goto IF_TRUE', arg='IF_TRUE')
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			@IF_TRUE
			D;JNE
			// Command(type='goto', raw='goto IF_FALSE', arg='IF_FALSE')
			@IF_FALSE
			0;JMP
			// Command(type='label', raw='label IF_TRUE', arg='IF_TRUE')
(IF_TRUE)
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

			// Command(type='label', raw='label IF_FALSE', arg='IF_FALSE')
(IF_FALSE)
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

				// Command(type='pushc', raw='push constant 2', arg=2)
				@2
				D=A
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

			// Command(type='call', raw='Main.Main.fibonacci', arg=1)
			// push returnaddr
			@RET631a52c1a8ca4badad6534a4ce1a38da
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
			@5
			D=D-A
			@1
			D=D-A

			@ARG
			M=D

			@Main.Main.fibonacci
			0;JMP

			(RET631a52c1a8ca4badad6534a4ce1a38da)

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

				// Command(type='pushc', raw='push constant 1', arg=1)
				@1
				D=A
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

			// Command(type='call', raw='Main.Main.fibonacci', arg=1)
			// push returnaddr
			@RET274223bad72248a4840375b5207df995
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
			@5
			D=D-A
			@1
			D=D-A

			@ARG
			M=D

			@Main.Main.fibonacci
			0;JMP

			(RET274223bad72248a4840375b5207df995)

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

			