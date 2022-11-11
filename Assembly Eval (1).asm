main:

# INITIALIZE / SETUP (FOR TESTING)
addi $a0, $0, 5



# FIBONACCI
addi $a0, $0, 5     # fibonacci iteration
addi $t0, $0, 0     # fib(0)
addi $t1, $0, 1     # fib(1)

iterate:
beq $a0, $0, return
add $t1, $t0, $t1
sub $t0, $t1, $t0
addi $a0, $a0, -1
j iterate

return:
add $v0, $0, $t0
j $ra
