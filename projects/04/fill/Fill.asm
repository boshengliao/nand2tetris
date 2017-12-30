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

// Put your code here.

@KBD
D=A
@E
M=D

@16384
D=A
@S
M=D

(LOOP)
@KBD
D=M
@UNFILL
D; JEQ

(FILL)
@E
D=M
@S
D=D-M
@LOOP
D;JEQ

D=1
@S
A=M
M=-1

D=1
@S
M=D+M
@LOOP
0;JMP

(UNFILL)
@SCREEN
D=A
@S
D=D-M
@LOOP
D;JGT

D=0
@S
A=M
M=D

D=1
@S
M=M-D

@LOOP
0;JMP
(END)