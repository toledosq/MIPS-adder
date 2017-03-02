# Author:	Christopher Smith
# Date:		1 MAR 2017
# Description: 	A simple MIPS program that allows the user to enter integers to add. Once a 0 is inputted, the sum of all previous inputs will be printed to the console.
#		Requires a MIPS simulator to run. Written in MARS 4.5

.data
    message:		.asciiz	"Enter integer: "	#Message prompt for user

.text
    top:
    li		$v0, 4					#Load string print call
    la		$a0, message				#Load prompt address
    syscall
    
    li		$v0, 5					#Read int call
    syscall						#Read in int
    
    add		$s1, $s1, $v0				#Add value to s1 (used for running total)
    
    bne		$v0, $zero, top				#If input != 0, jump to top
    
    
    printTotal:
    li		$v0, 1					#load print int call
    move	$a0, $s1				#Move running total into a0, print
    syscall
    
