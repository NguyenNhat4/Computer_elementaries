// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.
// Add R0 to R2 while R1 >= 0
    @R1
    D=M
    @i          // loop index
    M=D
    @R2
    M=0

(LOOP)
    @i
    D=M         // D=i
    @END
    D;JEQ       // If D == 0; go to END
    @R0
    D=M
    @R2
    M=D+M       // R2 = R2 + R0
    @i
    M=M-1       // i=i-1
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
