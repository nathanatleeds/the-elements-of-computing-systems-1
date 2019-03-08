// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

    @flag
    M=0
    @addrW
    M=0
    @addrB
    M=0
    @24576
    D=A
    @MAX_SCR
    M=D

(RESET)
    @SCREEN // 16384 -- 24576
    D=A
    @addrW
    M=D
    @addrB
    M=D
    @flag
    D=M
    @FILL
    D;JGT
    @CLEAR
    D;JEQ

(FILL)
    @flag   // Enter FILL loop
    M=1

    @addrB  // If enters @KBD
    D=M
    @MAX_SCR
    D=M-D
    @RESET
    D;JEQ   //Reset start point

    @addrB  // Fill screen
    D=M     // The value of @addrB is the addr of target pixel
    A=D     
    M=-1    // M=1 won't work, since we're operating 16-bit-ly
            // This only results arrays of 0000 0000 0000 0001
    @addrB
    M=M+1

    @KBD    // If no keys down
    D=M
    @CLEAR
    D;JEQ

    @FILL
    0;JMP

(CLEAR)
    @flag
    M=0

    @addrW  // If enters @KBD
    D=M
    @MAX_SCR
    D=M-D
    @RESET
    D;JEQ   //Reset start point

    @addrW  // Clear screen
    D=M
    A=D
    M=0     // Addr in A
    @addrW
    M=M+1
    
    @KBD    //Could be abstracted
    D=M
    @FILL
    D;JGT

    @CLEAR
    0;JMP
