import numpy as np

# Part 1
total_area = 0
area = 0

for box in open("day2_input.txt").readlines():
  # print ("Box = ", box)
  a,b ,c = np.sort([int(dim) for dim in box.split('x')])
  area = (3 * a * b) + (2 * b * c) + (2 * a * c)
  total_area += area

print("Part 1 =", total_area)

# Part 2
ribbon = 0
bow = 0

for box in open("day2_input.txt").readlines():
  a, b, c = np.sort([int(dim) for dim in box.split('x')])
  ribbon += (2 * a) + (2 * b)
  bow += a * b * c

print("Part 2 = ribbon + bow = ", ribbon, "+", bow, " = ", ribbon+bow)
