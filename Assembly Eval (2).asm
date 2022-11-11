main:

# INITIALIZE / SETUP (FOR TESTING)
addi $a0, $sp, 0    # array starting at the beginning of the heap 
addi $a1, $0, 4     # array length

addi $t0, $0, 8     # a[1]
addi $t1, $0, 9     # a[2]
addi $t2, $0, 19    # a[3]
addi $t3, $0, 31    # a[4]

sw $t0, 0($a0)
sw $t1, 4($a0)
sw $t2, 8($a0)
sw $t3, 12($a0)

addi $t0, $0, 10    # box 1
addi $t1, $0, 20    # box 2
addi $t2, $0, 30    # box 3



# ARRAY COUNTING 
add $t4, $t4, $0    # t5 stores current array index

iterate: beq $t4, $a1, return
lw $t5, 0($a0)      # value in current index

addi $s0, $s0, 1
slt $t6, $t5, $t0
bne $t6, $0, continue

addi $s0, $s0, -1
addi $s1, $s1, 1
slt $t6, $t5, $t1
bne $t6, $0, continue

addi $s1, $s1, -1
addi $s2, $s2, 1
slt $t6, $t5, $t2
bne $t6, $0, continue

addi $s2, $s2, -1
addi $s3, $s3, 1

continue:
add $a0, $a0, 4     # pointer to next index in array
addi $t4, $t4, 1    # increase index counter
j iterate

return:
j $ra
