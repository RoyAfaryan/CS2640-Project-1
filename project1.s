# Name:		Afaryan, Roy
# Homework:	Homework 2
# Due:		October 6, 2022
# Course:	cs-2640-04-f22

# Description:
#		A program that tells what coins to give out for any amount of change
#		from 1 cent to 99 cents.

	.data
prompt:	.ascii	"Change by R. Afaryan\n\n"
	.asciiz	"Enter the change: "

quarter:	.asciiz	"Quarter: "
dime:	.asciiz	"Dime: "
nickel:	.asciiz	"Nickel: "
penny:	.asciiz	"Penny: "
newline:	.asciiz	"\n"

	.text
main:
	la	$a0, prompt
	li	$v0, 4		# display prompt
	syscall
	li	$v0, 5		# read input
	syscall
	move	$t0, $v0
	la	$a0, newline
	li	$v0, 4		# display new line
	syscall

	la	$t4, 25		# quarter
	la	$t5, 10		# dime
	la	$t6, 5		# nickel

	div	$t0, $t4	# divide quarter
	mflo	$t1
	mfhi	$t0
	beqz	$t0, numberofQuarters

	div	$t0, $t5	# divide dime
	mflo	$t2					
	mfhi	$t0
	beqz	$t0, numberofQuarters

	div	$t0, $t6	# divide nickel
	mflo	$t3
	mfhi	$t0
	beqz	$t0, numberofQuarters


numberofQuarters:
	beqz	$t1, numberofDimes
	la	$a0, quarter
	li	$v0, 4		# display quarter
	syscall
	move	$a0, $t1        
	li	$v0, 1		# display number of quarters
	syscall
	la	$a0, newline
	li	$v0, 4		# display new line
	syscall

numberofDimes:
	beqz	$t2, numberofNickels
	la	$a0, dime
	li	$v0, 4		# display dime
	syscall
	move	$a0, $t2
	li	$v0, 1		# display number of dimes
	syscall
	la	$a0, newline
	li	$v0, 4		# display new line
	syscall

numberofNickels:
	beqz	$t3, numberofPennies
	la	$a0, nickel
	li	$v0, 4		# display nickel
	syscall
	move	$a0, $t3
	li	$v0, 1		# display number of nickels
	syscall
	la	$a0, newline
	li	$v0, 4		# display new line
	syscall

numberofPennies:
	beqz	$t0, exit
	la	$a0, penny
	li	$v0, 4		# display pennies
	syscall
	move	$a0, $t0
	li	$v0, 1		# display number of pennies
	syscall
	la	$a0, newline
	li	$v0, 4		# display new line
	syscall
	    
exit:
	li	$v0, 10		# exit
	syscall





	    

	     
	    



