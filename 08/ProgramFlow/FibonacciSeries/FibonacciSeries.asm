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

				// Command(type='pushc', raw='push constant 0', arg=0)
				@0
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='that', arg=0)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@THAT
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

				// Command(type='pushc', raw='push constant 1', arg=1)
				@1
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='that', arg=1)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@THAT
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

				// Command(type='label', raw='label MAIN_LOOP_START', arg='MAIN_LOOP_START')
(MAIN_LOOP_START)
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

				// Command(type='if-goto', raw='if-goto COMPUTE_ELEMENT', arg='COMPUTE_ELEMENT')
			
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

			@COMPUTE_ELEMENT
			D;JNE
			// Command(type='goto', raw='goto END_PROGRAM', arg='END_PROGRAM')
			@END_PROGRAM
			0;JMP
			// Command(type='label', raw='label COMPUTE_ELEMENT', arg='COMPUTE_ELEMENT')
(COMPUTE_ELEMENT)
// Command(type='push', raw='that', arg=0)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@THAT
				D=M
				@0
				A=D+A 			// Now we have the index

				D=M 			// Save the value

				
@SP
A=M
M=D
@SP
M=M+1

				// Command(type='push', raw='that', arg=1)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@THAT
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

			// Command(type='pop', raw='that', arg=2)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@THAT
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

				// Command(type='push', raw='pointer', arg=1)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@3
				D=A
				@1
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

				// Command(type='goto', raw='goto MAIN_LOOP_START', arg='MAIN_LOOP_START')
			@MAIN_LOOP_START
			0;JMP
			// Command(type='label', raw='label END_PROGRAM', arg='END_PROGRAM')
(END_PROGRAM)
