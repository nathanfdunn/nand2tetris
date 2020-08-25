
		// Sys.vm detected. Inserting call Sys.init 0
	
		// -b flag absent
		// Initalizing stack pointer
	
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
			@RETc5d05731c82a4b6e90934bafbdce056e
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

			(RETc5d05731c82a4b6e90934bafbdce056e)

			// Command(type='function', raw='Sys.init', arg=0, source='Sys')
			(Sys.init)		// Need to disambiguate?
			// Command(type='pushc', raw='push constant 6', arg=6, source='Sys')
				@6
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pushc', raw='push constant 8', arg=8, source='Sys')
				@8
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='call', raw='Class1.set', arg=2, source='Sys')
			// push returnaddr
			@RETe0ef69375f4c405391ddad11c03a7984
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

			@Class1.set
			0;JMP

			(RETe0ef69375f4c405391ddad11c03a7984)

			// Command(type='pop', raw='temp', arg=0, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@5
					D=A
					@0
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='pushc', raw='push constant 23', arg=23, source='Sys')
				@23
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pushc', raw='push constant 15', arg=15, source='Sys')
				@15
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='call', raw='Class2.set', arg=2, source='Sys')
			// push returnaddr
			@RET1867436f24974652b0cff5b3168b7cf0
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

			@Class2.set
			0;JMP

			(RET1867436f24974652b0cff5b3168b7cf0)

			// Command(type='pop', raw='temp', arg=0, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@5
					D=A
					@0
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='call', raw='Class1.get', arg=0, source='Sys')
			// push returnaddr
			@RET470056699b344bd292e54c7b71c26c92
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

			@Class1.get
			0;JMP

			(RET470056699b344bd292e54c7b71c26c92)

			// Command(type='call', raw='Class2.get', arg=0, source='Sys')
			// push returnaddr
			@RETd1d4fa08c2b3427ba7a85a066e406109
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

			@Class2.get
			0;JMP

			(RETd1d4fa08c2b3427ba7a85a066e406109)

			// Command(type='label', raw='label WHILE', arg='WHILE', source='Sys')
(WHILE)
// Command(type='goto', raw='goto WHILE', arg='WHILE', source='Sys')
			@WHILE
			0;JMP
			// Command(type='function', raw='Class1.set', arg=0, source='Class1')
			(Class1.set)		// Need to disambiguate?
			// Command(type='push', raw='argument', arg=0, source='Class1')
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

					// Command(type='pop', raw='static', arg=0, source='Class1')
					
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

					@Class1.0	// @Xxx.3
					M=D
					// Command(type='push', raw='argument', arg=1, source='Class1')
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

					// Command(type='pop', raw='static', arg=1, source='Class1')
					
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

					@Class1.1	// @Xxx.3
					M=D
					// Command(type='pushc', raw='push constant 0', arg=0, source='Class1')
				@0
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='return', raw='return', arg=None, source='Class1')
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

			// Command(type='function', raw='Class1.get', arg=0, source='Class1')
			(Class1.get)		// Need to disambiguate?
			// Command(type='push', raw='static', arg=0, source='Class1')
					@Class1.0	// @Xxx.3
					D=M
					
@SP
A=M
M=D
@SP
M=M+1

					// Command(type='push', raw='static', arg=1, source='Class1')
					@Class1.1	// @Xxx.3
					D=M
					
@SP
A=M
M=D
@SP
M=M+1

					// Command(type='arith', raw='sub', arg=None, source='Class1')
			
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

			// Command(type='return', raw='return', arg=None, source='Class1')
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

			// Command(type='function', raw='Class2.set', arg=0, source='Class2')
			(Class2.set)		// Need to disambiguate?
			// Command(type='push', raw='argument', arg=0, source='Class2')
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

					// Command(type='pop', raw='static', arg=0, source='Class2')
					
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

					@Class2.0	// @Xxx.3
					M=D
					// Command(type='push', raw='argument', arg=1, source='Class2')
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

					// Command(type='pop', raw='static', arg=1, source='Class2')
					
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

					@Class2.1	// @Xxx.3
					M=D
					// Command(type='pushc', raw='push constant 0', arg=0, source='Class2')
				@0
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='return', raw='return', arg=None, source='Class2')
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

			// Command(type='function', raw='Class2.get', arg=0, source='Class2')
			(Class2.get)		// Need to disambiguate?
			// Command(type='push', raw='static', arg=0, source='Class2')
					@Class2.0	// @Xxx.3
					D=M
					
@SP
A=M
M=D
@SP
M=M+1

					// Command(type='push', raw='static', arg=1, source='Class2')
					@Class2.1	// @Xxx.3
					D=M
					
@SP
A=M
M=D
@SP
M=M+1

					// Command(type='arith', raw='sub', arg=None, source='Class2')
			
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

			// Command(type='return', raw='return', arg=None, source='Class2')
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

			