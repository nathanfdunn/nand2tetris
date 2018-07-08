// Command(type='function', raw='Sys.init', arg=0)
			(Sys.init)
			// Command(type='pushc', raw='push constant 4000', arg=4000)
				@4000
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=0)
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

				// Command(type='pushc', raw='push constant 5000', arg=5000)
				@5000
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=1)
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

				// Command(type='call', raw='call Sys.main 0', arg=0)
			// push returnaddr
			@RET3022d1a275d847049ab1519003b39bc0
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
			@0
			D=D-A

			@ARG
			M=D

			@call Sys.main 0
			0;JMP

			(RET3022d1a275d847049ab1519003b39bc0)

			// Command(type='pop', raw='temp', arg=1)
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

				// Command(type='label', raw='label LOOP', arg='LOOP')
(LOOP)
// Command(type='goto', raw='goto LOOP', arg='LOOP')
			@LOOP
			0;JMP
			// Command(type='function', raw='Sys.main', arg=5)
			(Sys.main)
			
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

				// Command(type='pushc', raw='push constant 4001', arg=4001)
				@4001
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=0)
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

				// Command(type='pushc', raw='push constant 5001', arg=5001)
				@5001
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=1)
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

				// Command(type='pushc', raw='push constant 200', arg=200)
				@200
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='local', arg=1)
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

				// Command(type='pushc', raw='push constant 40', arg=40)
				@40
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='local', arg=2)
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

				// Command(type='pushc', raw='push constant 6', arg=6)
				@6
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='local', arg=3)
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

				// Command(type='pushc', raw='push constant 123', arg=123)
				@123
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='call', raw='call Sys.add12 1', arg=1)
			// push returnaddr
			@RET96ac31905a064ae5aa127b3c2a81d96d
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

			@call Sys.add12 1
			0;JMP

			(RET96ac31905a064ae5aa127b3c2a81d96d)

			// Command(type='pop', raw='temp', arg=0)
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

				// Command(type='push', raw='local', arg=2)
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

				// Command(type='push', raw='local', arg=3)
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

				// Command(type='push', raw='local', arg=4)
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

			// Command(type='function', raw='Sys.add12', arg=0)
			(Sys.add12)
			// Command(type='pushc', raw='push constant 4002', arg=4002)
				@4002
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=0)
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

				// Command(type='pushc', raw='push constant 5002', arg=5002)
				@5002
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='pointer', arg=1)
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

				// Command(type='pushc', raw='push constant 12', arg=12)
				@12
				D=A
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

			