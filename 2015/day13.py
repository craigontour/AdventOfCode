from itertools import permutations

data = open("day13_input.txt").readlines()
h = {}
ppl = []

for line in data:
  parts = line.split(' ')

  a = parts[0]
  if parts[2] == 'lose':
    units = -int(parts[3])
  else:
    units = int(parts[3])
  b = parts[-1]

  h[a + b] = units

  if a not in ppl: ppl.append(a)

print(h)
print(ppl)

perms = list(permutations(ppl))

part1 = 0

for perm in perms:
  total = 0
  for x in range(len(ppl)):
    if x == (len(ppl)-1):
      y = 0
    else:
      y = x + 1
    a = perm[x] + perm[y]
    # print("weight for", a, ":", weights[a])
    b = perm[y] + perm[x]
    # print("weight for", b, ":", weights[b])
    total += h[a] + h[b]

  print("Total for",perm," = ", total)
  if total > part1: part1 = total

print('Part 1:', part1)
