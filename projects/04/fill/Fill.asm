// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
    @SCREEN
    D=A
    @pixel_arr      // pointer that stores the screen's base address
    M=D            

    @KBD
    D=A             // keyboard register
    @pixel_arr_len
    M=D             // temp store the address of the keyboard memory address
    @pixel_arr
    D=M
    @pixel_arr_len
    M=M-D           // number of elements to manipulate from substracting address of screen from keyboard

(CHECK)
    @i
    M=0             // init or reset the iterator pointer
    @KBD
    D=M
    @BLACK
    D;JGT           // if D > 0; blacken the screen
    @WHITE
    0;JMP           // else; clear the screen

(BLACK)
    @i
    D=M
    @pixel_arr_len
    D=D-M
    @CHECK
    D;JEQ           // if loop is finished; continue to check keyboard input

    @pixel_arr
    D=M
    @i
    A=D+M
    M=-1            // -1 = 1111111111111111

    @i
    M=M+1           // i++

    @BLACK
    0;JMP

(WHITE)
    @i
    D=M
    @pixel_arr_len
    D=D-M
    @CHECK
    D;JEQ           // if loop is finished; continue to check keyboard input

    @pixel_arr
    D=M
    @i
    A=D+M
    M=0             // 0 = 0000000000000000

    @i
    M=M+1           // i++

    @WHITE
    0;JMP

(END)
    @END
    0;JMP
