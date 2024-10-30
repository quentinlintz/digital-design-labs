# Convert a big-endian 32-bit integer to a little-endian 32-bit integer

.global _start

.section .text

_start:
# Set up
li  t0, 0x300
li  t1, 0x12
jal ra, store
li  t1, 0x34
jal ra, store
li  t1, 0xAB
jal ra, store
li  t1, 0xCD
jal ra, store
li  t0, 0x300

# Start swapping
lb t2, 0(t0)
sb t1, 0(t0)
sb t2, 3(t0)
lb t2, 1(t0)
lb t3, 2(t0)
sb t2, 2(t0)
sb t3, 1(t0)

j end

store:
	sb   t1, 0(t0)
	addi t0, t0, 1
	jr   ra

end:
	addi a0, zero, 0
