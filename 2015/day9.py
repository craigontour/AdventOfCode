# keywords: iteration, permmuation, 2D array

from itertools import permutations

places = set()
p = []
distances = {}

for j in open("day9_input.txt"):
  a, _, b, _, d = j.strip().split(' ')
  # print("From {} to {} is {}".format(a, b, d))
  places.add(a)
  places.add(b)
  
  distances.setdefault(a, dict())[b] = int(d)
  distances.setdefault(b, dict())[a] = int(d)
  
print(places)
print(' ')

print(distances)
print(' ')

for p in places:
  l = distances.setdefault(p)
  print(p,":",l)

print(' ')
paths = {}

for q in places:
  total = 0
  for r in places:
    if q != r:
      dst = distances[q][r]
      print("distance from",q,"to",r,"is", dst)
      total += dst
  paths[q] = total

print(' ')
print(paths)
