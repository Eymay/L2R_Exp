import numpy as np

AB_array = np.zeros((2**8-1, 3), dtype=np.uint16)

for A in range(2, 2**16):
    for B in range(2, 2**16):
        if A**B > 2**16-1:
            break
        AB_array[A-2, 0] = np.uint16(A)
        AB_array[A-2, 1] = np.uint16(B-1)
        AB_array[A-2, 2] = np.uint16(A**(B-1))

with open('L2RExp_tb.hex', 'w') as f:
    for row in AB_array:
        f.write('{:04X}_{:04X}_{:04X}\n'.format(row[0], row[1], row[2]))

print(AB_array)
