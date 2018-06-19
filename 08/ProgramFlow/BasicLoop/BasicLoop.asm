// Command(type='pushc', raw='push constant 0', arg=0)
				@0
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='local', arg=0)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@LCL
				D=M
				@0
				D=D+A 			// Now we have the index

@R14
M=D  			// Cache the write address


@R13  			// Fetch the value
D=M

@R14
A=M
M=D 			// FINALLY write the value...

				// Command(type='label', raw='label LOOP_START', arg='LOOP_START')(LOOP_START)// Command(type='push', raw='argument', arg=0)
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

			// Command(type='pop', raw='local', arg=0)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@LCL
				D=M
				@0
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

			// Command(type='pop', raw='argument', arg=0)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@ARG
				D=M
				@0
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

				// Command(type='if-goto', raw='if-goto LOOP_START', arg='LOOP_START')
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			@LOOP_START
			D;JNE
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

				