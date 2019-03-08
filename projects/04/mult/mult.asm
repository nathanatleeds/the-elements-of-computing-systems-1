// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    @2      // Initialize sum as 0
    M=0     
    @0      // Ensure R0 and R1 != 0   
    D=M
    @END
    D;JEQ
    @1
    D=M
    @END
    D;JEQ

    @0      // sum = R0
    D=M
    @2
    M=D

(LOOP)
    @1      // If R1 == 0
    M=M-1
    D=M
    @END    // Jmp to END
    D;JEQ

    @0      // R2 += R0
    D=M
    @2
    M=M+D
    @LOOP
    0;JMP

(END)
    @END
    0;JMP
