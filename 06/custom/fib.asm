// Puts the 10th fibbonacci number in R2

// Set counter = 10
@10
D=A
@counter
M=D


// Set M[0] = F_0
@1
D=A
@R0
M=D

// Set M[1] = F_1
@1
D=A
@R1
M=D

(Iterate)

// Set D = M[0] + M[1] (F_N)
@R0
D=M
@R1
D=D+M

// Save result in M[2]
@R2
M=D


// Set M[0] = M[1] (F_{N-1})
@R1
D=M
@R0
M=D

// Set M[1] = M[2] (F_N)
@R2
D=M
@R1
M=D

// Decrement counter
@counter
MD=M-1
@Iterate
D;JGT
