// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.
// Add R0 to R2 while R1 >= 0
    @R2
    M=0
// Check if R0 > R1 using R0 - R1 = x
// if x is >= 0 then R0 is greater; R0 should be the k
// else if x is < 0 then R1 is greater
    @R0
    D=M
    @R1
    D=D-A       // D=R0-R1
    @FLIP
    D;JLT       // jump to FLIP if D < 0; R1 > R0
    @R1
    D=M
    @i          // loop index
    M=D
    @R0
    D=M
    @k
    M=D
    @LOOP
    0;JMP

(FLIP)
    @R0
    D=M
    @i
    M=D
    @R1
    D=M
    @k
    M=D
    @LOOP
    0;JMP

(LOOP)
    @i
    D=M         // D=i
    @END
    D;JEQ       // If D == 0; go to END
    @k
    D=M
    @R2
    M=D+M       // R2 = R2 + k
    @i
    M=M-1       // i=i-1
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
