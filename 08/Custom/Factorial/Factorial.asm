
	@256
	D=A
	@SP
	M=D
// Command(type='function', raw='Sys.init', arg=0, source='Sys')
			(Sys.init)		// Need to disambiguate?
			// Command(type='call', raw='Main.test', arg=0, source='Sys')
			// push returnaddr
			@RETa10921c11c4f437fbb51acb94fb46e99
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

			@Main.test
			0;JMP

			(RETa10921c11c4f437fbb51acb94fb46e99)

			// Command(type='call', raw='Main.test', arg=0, source='Main')
			// push returnaddr
			@RET577fdda4ca33420cbdec46f0bdd89505
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

			@Main.test
			0;JMP

			(RET577fdda4ca33420cbdec46f0bdd89505)

			// Command(type='function', raw='Main.factorial', arg=0, source='Main')
			(Main.factorial)		// Need to disambiguate?
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
				@ADDR263cec95db3045a09ff726ff521a0f07	
				D;JLT		// If we're correct, skip the part where we set to false

				@SP
				A=M
				M=0

				(ADDR263cec95db3045a09ff726ff521a0f07)

				
@SP
M=M+1

				// Command(type='if-goto', raw='if-goto BASECASE', arg='BASECASE', source='Main')
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			@BASECASE
			D;JNE
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

			// Command(type='call', raw='Main.factorial', arg=1, source='Main')
			// push returnaddr
			@RETe2869130e2714582825b2e279e5f7711
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

			@Main.factorial
			0;JMP

			(RETe2869130e2714582825b2e279e5f7711)

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

					// Command(type='call', raw='Main.multpos', arg=2, source='Main')
			// push returnaddr
			@RETa0f7127779954d53bd6c24c4600b382b
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
			@2
			D=D-A
			@5
			D=D-A

			@ARG
			M=D

			@Main.multpos
			0;JMP

			(RETa0f7127779954d53bd6c24c4600b382b)

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

			// Command(type='label', raw='label BASECASE', arg='BASECASE', source='Main')
(BASECASE)
// Command(type='pushc', raw='push constant 1', arg=1, source='Main')
				@1
				D=A
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

			// Command(type='function', raw='Main.multpos', arg=0, source='Main')
			(Main.multpos)		// Need to disambiguate?
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

					// Command(type='pushc', raw='push constant 0', arg=0, source='Main')
				@0
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='cmp', raw='eq', arg=None, source='Main')
				
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

				D=M-D		// Comparison

				M=-1		// Set to true
				@ADDRe9abdd1fec744206b41129e7ce1b2140	
				D;JEQ		// If we're correct, skip the part where we set to false

				@SP
				A=M
				M=0

				(ADDRe9abdd1fec744206b41129e7ce1b2140)

				
@SP
M=M+1

				// Command(type='if-goto', raw='if-goto ZERO', arg='ZERO', source='Main')
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			@ZERO
			D;JNE
			// Command(type='push', raw='argument', arg=1, source='Main')
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

					// Command(type='pushc', raw='push constant 0', arg=0, source='Main')
				@0
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='cmp', raw='eq', arg=None, source='Main')
				
@SP
M=M-1		// decrement SP
A=M
D=M 		// save arg 1

@SP
M=M-1		// decrement SP
A=M 		// load up arg 2

				D=M-D		// Comparison

				M=-1		// Set to true
				@ADDR97d62e6333ed4134a39fdaf27c416899	
				D;JEQ		// If we're correct, skip the part where we set to false

				@SP
				A=M
				M=0

				(ADDR97d62e6333ed4134a39fdaf27c416899)

				
@SP
M=M+1

				// Command(type='if-goto', raw='if-goto ZERO', arg='ZERO', source='Main')
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			@ZERO
			D;JNE
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

					// Command(type='push', raw='argument', arg=1, source='Main')
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

			// Command(type='call', raw='Main.multpos', arg=2, source='Main')
			// push returnaddr
			@RET0c6436eb567d4d478e69189ebe005c9b
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
			@2
			D=D-A
			@5
			D=D-A

			@ARG
			M=D

			@Main.multpos
			0;JMP

			(RET0c6436eb567d4d478e69189ebe005c9b)

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

			// Command(type='label', raw='label ZERO', arg='ZERO', source='Main')
(ZERO)
// Command(type='pushc', raw='push constant 0', arg=0, source='Main')
				@0
				D=A
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

			// Command(type='function', raw='Main.test', arg=0, source='Main')
			(Main.test)		// Need to disambiguate?
			// Command(type='pushc', raw='push constant 3', arg=3, source='Main')
				@3
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='call', raw='Main.factorial', arg=1, source='Main')
			// push returnaddr
			@RET9c901e48141f4b27a311fc3d5359d026
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

			@Main.factorial
			0;JMP

			(RET9c901e48141f4b27a311fc3d5359d026)

			// Command(type='label', raw='label WHILE', arg='WHILE', source='Main')
(WHILE)
// Command(type='goto', raw='goto WHILE', arg='WHILE', source='Main')
			@WHILE
			0;JMP
			// Command(type='call', raw='Sys.init', arg=0, source='SYSTEM')
			// push returnaddr
			@RET958c0e6c908d4355a4099b94aa3e0774
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

			(RET958c0e6c908d4355a4099b94aa3e0774)

			