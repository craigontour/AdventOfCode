import numpy as np

dim = 1000
lights = np.zeros( (dim, dim) )

# # Part 1
# for line in open("day6_input.txt").readlines():

#   parts = line.split(' ')
#   if len(parts) == 4:
#     action = 't'
#     sX, sY = parts[1].split(',')
#     eX, eY = parts[3].split(',')
#   else:
#     action = parts[1]
#     sX, sY = parts[2].split(',')
#     eX, eY = parts[4].split(',')
  
#   for row in range(int(sY), int(eY)+1):
#     for col in range(int(sX), int(eX)+1):
#       # print("row:", row, "col:", col)
#       if action == 't':
#         lights[row, col] = (lights[row, col] + 1) % 2
#       elif action == 'on':
#         lights[row, col] = 1
#       else:
#         lights[row, col] = 0

# l = 0
# for r in range(dim):
#   for c in range(dim):
#     if lights[r, c] == 1:
#       l += 1

# print("Part 1:",l)

# Part 2
for line in open("day6_input.txt").readlines():
  b = 0
  parts = line.split(' ')
  # print("parts = ", parts)
  if len(parts) == 4:
    b = 2
    sX, sY = parts[1].split(',')
    eX, eY = parts[3].split(',')
  else:
    if parts[1].strip() == 'on':
      b = 1
    else:
      b = -1
    sX, sY = parts[2].split(',')
    eX, eY = parts[4].split(',')
  
  for row in range(int(sY), int(eY)+1):
    for col in range(int(sX), int(eX)+1):
      # print("row:", row, "col:", col, "brightness:", b)
      lights[row, col] += b
      if lights[row, col] < 0:
        lights[row, col] = 0

l = 0
for r in range(dim):
  for c in range(dim):
    l += lights[r, c]

print(int(l))
# print(lights)
