# Day 10
# For each asteroid (#) in matrix:
# - get coord (x,y)
# - skip if coord is a multiple of another asteroid
# - else add 1 to count

input = open('day10_input.txt').read().split('\n')

print ''

def printGrid(grid):
  for y in range(len(grid)):
    s = ""
    for x in range(len(grid[0])):
      s += grid[y][x]
    print s

asteroids = []
for line in input:
  asteroids.append(line)
  # print line

xlen = len(asteroids)
ylen = len(asteroids[0])

counts = []

print xlen, ylen
for y in range(ylen):
  for x in range(xlen):
    if asteroids[y][x] == "#":
      counts[y][x] = 0
      
