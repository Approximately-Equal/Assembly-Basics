main:

# INITIALIZE / SETUP (FOR TESTING)
add $a0, $sp, $0
addi $a1, $a0, 128
addi $a2, $0, 3

addi $t0, $0, 1
addi $t1, $0, 2
addi $t2, $0, 3

sw $t0, 0($a0)
sw $t1, 4($a0)
sw $t2, 8($a0)

addi $t0, $0, 2
addi $t1, $0, 3
addi $t2, $0, 1

sw $t0, 0($a1)
sw $t1, 4($a1)
sw $t2, 8($a1)



# ARRAY PERMUTATION
add $t0, $0, $0

iterate: beq $t0, $a2, return
add $t1, $t0, $0
sll $t1, $t1, 2     # bits to current index

add $t2, $a1, $t1
lw $t2, 0($t2)
addi $t2, $t2, -1
sll $t2, $t2, 2     # bits to move a - a[p[i]]

add $t3, $a0, $t1   # address of a[i]
lw $t4, 0($t3)      # value of a[i]

add $t5, $a0, $t2   # address of a[p[i]]
lw $t6, 0($t5)      # value if a[p[i]]

sw $t6 0($t3)
sw $t4 0($t5)

addi $t0, $t0, 1
j iterate

return:
lw $t0, 0($a0)
lw $t1, 4($a0)
lw $t2, 8($a0)

j $ra
