# Day 10
# For each asteroid (#) in matrix:
# - get coord (x,y)
# - skip if coord is a multiple of another asteroid
# - else add 1 to count
from math import atan2, pi, degrees

input = open('day10_input.txt').read().split('\n')

def printGrid(grid):
  for y in range(len(grid)):
    s = ""
    for x in range(len(grid[0])):
      s += grid[y][x]
    print(s)

asteroids = []
for line in input:
  asteroids.append(line)
  print(line)

xlen = len(asteroids)
ylen = len(asteroids[0])
# print xlen, ylen

coords = [] # [0 for x in range(xlen)] for i in range(ylen) ]
for y in range(ylen):
  for x in range(xlen):
    if asteroids[y][x] == "#":
      coords.append([x,y])

print("total coords=",len(coords))

def angle(a,b):
  return degrees(atan2(b[0] - a[0], a[1] - b[1]) % (2 * pi))

counts = []
for a1 in coords:
  visible = []
  for a2 in coords:
    if a1 != a2:
      ang = angle(a1, a2)
      # print(a1,a2,"=",ang)
      if ang not in visible:
        visible.append(ang)
  # print("total visible=",len(visible))
  counts.append(len(visible))

m = max(counts)
# print("max=",m)
part1 = [i for i, j in enumerate(counts) if j == m]
print("Part 1 is:",coords[part1[0]])

# Part 2
# - to exterminate, go through the list
station = coords[part1[0]]
visible = []
for asteroid in coords:
  if station != asteroid:
    ang = angle(station, asteroid)
    print("angle from station to asteroid is:", ang)
    if ang not in visible:
      visible.append(ang)

visibles = []
visibles = [station, visible(coords, station))]

print(visibles)

# print(len(visible))
# visible.sort()
# print("sorted visible: ", visible)
# # dont know the coords of each asteroid now though
