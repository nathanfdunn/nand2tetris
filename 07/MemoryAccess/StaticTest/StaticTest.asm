// Command(type='pushc', raw='push constant 111', arg=111)
				@111
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pushc', raw='push constant 333', arg=333)
				@333
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pushc', raw='push constant 888', arg=888)
				@888
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='static', arg=8)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@16
				D=A
				@8
				D=D+A 			// Now we have the index

@R14
M=D  			// Cache the write address


@R13  			// Fetch the value
D=M

@R14
A=M
M=D 			// FINALLY write the value...

				// Command(type='pop', raw='static', arg=3)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@16
				D=A
				@3
				D=D+A 			// Now we have the index

@R14
M=D  			// Cache the write address


@R13  			// Fetch the value
D=M

@R14
A=M
M=D 			// FINALLY write the value...

				// Command(type='pop', raw='static', arg=1)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@16
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

				// Command(type='push', raw='static', arg=3)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@16
				D=A
				@3
				A=D+A 			// Now we have the index

				D=M 			// Save the value

				
@SP
A=M
M=D
@SP
M=M+1

				// Command(type='push', raw='static', arg=1)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@16
				D=A
				@1
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

			// Command(type='push', raw='static', arg=8)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@16
				D=A
				@8
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

			