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
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

					@StaticTest.8	// @Xxx.3
					M=D
					// Command(type='pop', raw='static', arg=3)
					
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

					@StaticTest.3	// @Xxx.3
					M=D
					// Command(type='pop', raw='static', arg=1)
					
	@SP
	M=M-1	// decrement SP
	A=M
	D=M 	// save arg

					@StaticTest.1	// @Xxx.3
					M=D
					// Command(type='push', raw='static', arg=3)
					@StaticTest.3	// @Xxx.3
					D=M
					
@SP
A=M
M=D
@SP
M=M+1

					// Command(type='push', raw='static', arg=1)
					@StaticTest.1	// @Xxx.3
					D=M
					
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
					@StaticTest.8	// @Xxx.3
					D=M
					
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

			