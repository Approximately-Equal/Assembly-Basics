main:

# INITIALIZE / SETUP (FOR TESTING)
add $a0, $sp, $0

addi $t0, $0, 16
addi $t1, $a0, 128
sh $t0, 0($a0)
sw $t1, 4($a0)
add $a0, $t1, $0

addi $t0, $0, 24
addi $t1, $0, 0
sh $t0, 0($a0)
sw $t1, 4($a0)

add $a0, $sp, $0



# LINKED LIST SUM 
add $t2, $0, $0     # make sure running sum initializes 0

while:
lh $t0, 0($a0)      # load value of node
lw $t1, 4($a0)      # load pointer of node
add $t2, $t2, $t0   # add value to running sum

beq $t1, $0, return

add $a0, $t1, $0    # move to next node in linked list
j while

return:
add $v0, $0, $t2
j $ra
