# Day 4 python
import hashlib

solved = False
seed = 0

while not solved:
  str2hash = 'iwrupvqb' + f'{seed:05}'
  # print(str2hash)
  h = hashlib.md5(str2hash.encode()).hexdigest()
  if h[:6] == "000000":
    print("Part 2 = ", seed)
    solved = True
  elif h[:5] == "00000":
    print("Part 1 = ", seed)
  seed += 1
