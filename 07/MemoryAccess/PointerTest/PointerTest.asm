// Command(type='pushc', raw='push constant 3030', arg=3030)
				@3030
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

				// Command(type='pushc', raw='push constant 3040', arg=3040)
				@3040
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

				// Command(type='pushc', raw='push constant 32', arg=32)
				@32
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='this', arg=2)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@THIS
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

				// Command(type='pushc', raw='push constant 46', arg=46)
				@46
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='that', arg=6)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@THAT
				D=M
				@6
				D=D+A 			// Now we have the index

@R14
M=D  			// Cache the write address


@R13  			// Fetch the value
D=M

@R14
A=M
M=D 			// FINALLY write the value...

				// Command(type='push', raw='pointer', arg=0)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@3
				D=A
				@0
				A=D+A 			// Now we have the index

				D=M 			// Save the value

				
@SP
A=M
M=D
@SP
M=M+1

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

			// Command(type='push', raw='this', arg=2)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@THIS
				D=M
				@2
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

			// Command(type='push', raw='that', arg=6)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@THAT
				D=M
				@6
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

			