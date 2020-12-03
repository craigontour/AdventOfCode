from itertools import permutations
import numpy as np

input = []
for line in open('day1.txt', 'r'):
  input.append(int(line))

# input = [
#   1721,
#   979,
#   366,
#   299,
#   675,
#   1456
# ]

def solution(n):
  for arr in list(permutations(input, n)):
    if sum(arr) == 2020:
      return np.prod(arr)

print("Part 1 =", solution(2))
print("Part 2 =", solution(3))
