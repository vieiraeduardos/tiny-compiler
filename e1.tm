* TINY Compilation to TM Code
* File: e1.tm
* Standard prelude:
  0:     LD  6,0(0) 	load maxaddress from location 0
  1:     ST  0,0(0) 	clear location 0
* End of standard prelude.
  2:     IN  0,0,0 	read integer value
  3:     ST  0,0(5) 	read: store value
  4:     IN  0,0,0 	read integer value
  5:     ST  0,1(5) 	read: store value
* -> while
* -> Op
* -> Id
  6:     LD  0,1(5) 	load id value
* <- Id
  7:     ST  0,0(6) 	op: push left
* -> Const
  8:    LDC  0,5(0) 	load const
* <- Const
  9:     LD  1,0(6) 	op: load left
 10:    SUB  0,1,0 	op <
 11:    JLT  0,2(7) 	br if true
 12:    LDC  0,0(0) 	false case
 13:    LDA  7,1(7) 	unconditional jmp
 14:    LDC  0,1(0) 	true case
* <- Op
* -> while
* -> Op
* -> Id
 16:     LD  0,0(5) 	load id value
* <- Id
 17:     ST  0,0(6) 	op: push left
* -> Const
 18:    LDC  0,10(0) 	load const
* <- Const
 19:     LD  1,0(6) 	op: load left
 20:    SUB  0,1,0 	op <
 21:    JLT  0,2(7) 	br if true
 22:    LDC  0,0(0) 	false case
 23:    LDA  7,1(7) 	unconditional jmp
 24:    LDC  0,1(0) 	true case
* <- Op
* -> assign
* -> Op
* -> Id
 26:     LD  0,0(5) 	load id value
* <- Id
 27:     ST  0,0(6) 	op: push left
* -> Const
 28:    LDC  0,1(0) 	load const
* <- Const
 29:     LD  1,0(6) 	op: load left
 30:    ADD  0,1,0 	op +
* <- Op
 31:     ST  0,0(5) 	assign: store value
* <- assign
* -> Id
 32:     LD  0,0(5) 	load id value
* <- Id
 33:    OUT  0,0,0 	write ac
 34:    LDA  7,-19(7) 	while: jump after body comes back here
 25:    JEQ  0,9(7) 	while: jump back to body
* <- while
* -> assign
* -> Op
* -> Id
 35:     LD  0,1(5) 	load id value
* <- Id
 36:     ST  0,0(6) 	op: push left
* -> Const
 37:    LDC  0,1(0) 	load const
* <- Const
 38:     LD  1,0(6) 	op: load left
 39:    ADD  0,1,0 	op +
* <- Op
 40:     ST  0,1(5) 	assign: store value
* <- assign
* -> Id
 41:     LD  0,1(5) 	load id value
* <- Id
 42:    OUT  0,0,0 	write ac
 43:    LDA  7,-38(7) 	while: jump after body comes back here
 15:    JEQ  0,28(7) 	while: jump back to body
* <- while
* End of execution.
 44:   HALT  0,0,0 	
