* TINY Compilation to TM Code
* File: example.tm
* Standard prelude:
  0:     LD  6,0(0) 	load maxaddress from location 0
  1:     ST  0,0(0) 	clear location 0
* End of standard prelude.
* -> assign
* -> Const
  2:    LDC  0,0(0) 	load const
* <- Const
  3:     ST  0,0(5) 	assign: store value
* <- assign
* -> repeat
* repeat: jump after body comes back here
* -> assign
* -> Op
* -> Id
  5:     LD  0,0(5) 	load id value
* <- Id
  6:     ST  0,0(6) 	op: push left
* -> Const
  7:    LDC  0,1(0) 	load const
* <- Const
  8:     LD  1,0(6) 	op: load left
  9:    ADD  0,1,0 	op +
* <- Op
 10:     ST  0,0(5) 	assign: store value
* <- assign
* -> Op
* -> Id
 11:     LD  0,0(5) 	load id value
* <- Id
 12:     ST  0,0(6) 	op: push left
* -> Const
 13:    LDC  0,10(0) 	load const
* <- Const
 14:     LD  1,0(6) 	op: load left
 15:    SUB  0,1,0 	op <
 16:    JLT  0,2(7) 	br if true
 17:    LDC  0,0(0) 	false case
 18:    LDA  7,1(7) 	unconditional jmp
 19:    LDC  0,1(0) 	true case
* <- Op
 20:    JEQ  0,-17(7) 	repeat: jmp back to body
* <- repeat
* -> Id
 21:     LD  0,0(5) 	load id value
* <- Id
 22:    OUT  0,0,0 	write ac
* End of execution.
 23:   HALT  0,0,0 	
