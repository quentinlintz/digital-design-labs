# Determine if the value in a0 is divisible by 9
# If it is, set a0 to 1, otherwise set a0 to 0
# Assume a0 is a positive integer

.global _start

.section .text
_start:
  addi a0, zero, 9 # Start with the input
  beq a0, zero, div # If the input is 0, it is divisible by 9
dec:
  addi a0, a0, -9 # Subtract 9 from the input
  beq a0, zero, div # If the input is 0, it is divisible by 9
  blt a0, zero, not # If the input is negative, it is not divisible by 9
  j not 
div:
  addi a0, zero, 1
  j done
not:
  addi a0, zero, 0
  j done
done:
  addi a7, zero, 93
  ecall
