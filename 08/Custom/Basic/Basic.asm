
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
	// Command(type='function', raw='Sys.init', arg=0, source='Sys')
			(Sys.init)		// Need to disambiguate?
			// Command(type='pushc', raw='push constant 345', arg=345, source='Sys')
				@345
				D=A
				@SP
				A=M
				M=D
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

			// Command(type='call', raw='Sys.init', arg=0, source='SYSTEM')
			// push returnaddr
			@RETbc861fd0fb8f43048840806d4607db67
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

			(RETbc861fd0fb8f43048840806d4607db67)

			