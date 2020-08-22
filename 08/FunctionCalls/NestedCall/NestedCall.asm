
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
			@RET7e9e9f1ece244a7bb1c7d7b2acce6b1f
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

			(RET7e9e9f1ece244a7bb1c7d7b2acce6b1f)

			// Command(type='function', raw='Sys.init', arg=0, source='Sys')
			(Sys.init)		// Need to disambiguate?
			// Command(type='pushc', raw='push constant 4000', arg=4000, source='Sys')
				@4000
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=0, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@3
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

					// Command(type='pushc', raw='push constant 5000', arg=5000, source='Sys')
				@5000
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=1, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@3
					D=A
					@1
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='call', raw='Sys.main', arg=0, source='Sys')
			// push returnaddr
			@RET506067030bda49a4bb1a5d05f0a5c905
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

			@Sys.main
			0;JMP

			(RET506067030bda49a4bb1a5d05f0a5c905)

			// Command(type='pop', raw='temp', arg=1, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@5
					D=A
					@1
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='label', raw='label LOOP', arg='LOOP', source='Sys')
(LOOP)
// Command(type='goto', raw='goto LOOP', arg='LOOP', source='Sys')
			@LOOP
			0;JMP
			// Command(type='function', raw='Sys.main', arg=5, source='Sys')
			(Sys.main)		// Need to disambiguate?
			
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

				
				@SP
				A=M
				M=0				// Initialize to zero
				
@SP
M=M+1

				// Command(type='pushc', raw='push constant 4001', arg=4001, source='Sys')
				@4001
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=0, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@3
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

					// Command(type='pushc', raw='push constant 5001', arg=5001, source='Sys')
				@5001
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=1, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@3
					D=A
					@1
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='pushc', raw='push constant 200', arg=200, source='Sys')
				@200
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='local', arg=1, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@LCL
					D=M
					@1
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='pushc', raw='push constant 40', arg=40, source='Sys')
				@40
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='local', arg=2, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@LCL
					D=M
					@2
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='pushc', raw='push constant 6', arg=6, source='Sys')
				@6
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='local', arg=3, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@LCL
					D=M
					@3
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='pushc', raw='push constant 123', arg=123, source='Sys')
				@123
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='call', raw='Sys.add12', arg=1, source='Sys')
			// push returnaddr
			@RETb03b047f32be4bd7b7907a4bf58ced3e
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

			@Sys.add12
			0;JMP

			(RETb03b047f32be4bd7b7907a4bf58ced3e)

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

					// Command(type='push', raw='local', arg=0, source='Sys')
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

					// Command(type='push', raw='local', arg=1, source='Sys')
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

					// Command(type='push', raw='local', arg=2, source='Sys')
					// Get the segment base
					// Add the index
					// Load the value there
					// Push it on the stack
					@LCL
					D=M
					@2
					A=D+A 			// Now we have the index

					D=M 			// Save the value

	@SP
	A=M
	M=D
	@SP
	M=M+1

					// Command(type='push', raw='local', arg=3, source='Sys')
					// Get the segment base
					// Add the index
					// Load the value there
					// Push it on the stack
					@LCL
					D=M
					@3
					A=D+A 			// Now we have the index

					D=M 			// Save the value

	@SP
	A=M
	M=D
	@SP
	M=M+1

					// Command(type='push', raw='local', arg=4, source='Sys')
					// Get the segment base
					// Add the index
					// Load the value there
					// Push it on the stack
					@LCL
					D=M
					@4
					A=D+A 			// Now we have the index

					D=M 			// Save the value

	@SP
	A=M
	M=D
	@SP
	M=M+1

					// Command(type='arith', raw='add', arg=None, source='Sys')
			
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

			// Command(type='arith', raw='add', arg=None, source='Sys')
			
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

			// Command(type='arith', raw='add', arg=None, source='Sys')
			
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

			// Command(type='arith', raw='add', arg=None, source='Sys')
			
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

			// Command(type='return', raw='return', arg=None, source='Sys')
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

			// Command(type='function', raw='Sys.add12', arg=0, source='Sys')
			(Sys.add12)		// Need to disambiguate?
			// Command(type='pushc', raw='push constant 4002', arg=4002, source='Sys')
				@4002
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=0, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@3
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

					// Command(type='pushc', raw='push constant 5002', arg=5002, source='Sys')
				@5002
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=1, source='Sys')
	@SP
	M=M-1		// decrement first
	A=M
	D=M 		// now it's loaded up

	@R13 			// R13 will hold the value til we can figure out where to write it
	M=D 


					@3
					D=A
					@1
					D=D+A 			// Now we have the index

	@R14
	M=D  			// Cache the write address


	@R13  			// Fetch the value
	D=M

	@R14
	A=M
	M=D 			// FINALLY write the value...

					// Command(type='push', raw='argument', arg=0, source='Sys')
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

					// Command(type='pushc', raw='push constant 12', arg=12, source='Sys')
				@12
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='arith', raw='add', arg=None, source='Sys')
			
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

			// Command(type='return', raw='return', arg=None, source='Sys')
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

			