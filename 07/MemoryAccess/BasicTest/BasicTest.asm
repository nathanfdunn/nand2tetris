// Command(type='pushc', raw='push constant 10', arg=10)
				@10
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

				// Command(type='pushc', raw='push constant 21', arg=21)
				@21
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pushc', raw='push constant 22', arg=22)
				@22
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='argument', arg=2)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@ARG
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

				// Command(type='pop', raw='argument', arg=1)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@ARG
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

				// Command(type='pushc', raw='push constant 36', arg=36)
				@36
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='this', arg=6)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@THIS
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

				// Command(type='pushc', raw='push constant 42', arg=42)
				@42
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pushc', raw='push constant 45', arg=45)
				@45
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='that', arg=5)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@THAT
				D=M
				@5
				D=D+A 			// Now we have the index

@R14
M=D  			// Cache the write address


@R13  			// Fetch the value
D=M

@R14
A=M
M=D 			// FINALLY write the value...

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

				// Command(type='pushc', raw='push constant 510', arg=510)
				@510
				D=A
				@SP
				A=M
				M=D
				@SP
				M=M+1
				// Command(type='pop', raw='temp', arg=6)
				
@SP
M=M-1		// decrement first
A=M
D=M 		// now it's loaded up

@R13 			// R13 will hold the value til we can figure out where to write it
M=D 


				@5
				D=A
				@6
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

				// Command(type='push', raw='that', arg=5)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@THAT
				D=M
				@5
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

			// Command(type='push', raw='this', arg=6)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@THIS
				D=M
				@6
				A=D+A 			// Now we have the index

				D=M 			// Save the value

				
@SP
A=M
M=D
@SP
M=M+1

				// Command(type='push', raw='this', arg=6)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@THIS
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

			// Command(type='push', raw='temp', arg=6)
				// Get the segment base
				// Add the index
				// Load the value there
				// Push it on the stack
				@5
				D=A
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

			