import numpy as np

moveX = { '>': 1, '<': -1, '^': 0, 'v': 0}
moveY = { '>': 0, '<': 0, '^': 1, 'v': -1}

# Part 1
x = 0
y = 0
houses = [ (x,y) ]

for dir in open("day3_input.txt").read():
  # if dir == '>':
  #   x += 1
  # elif dir == '<':
  #   x -= 1
  # elif dir == '^':
  #   y += 1
  # else:
  #   y -= 1
  x += moveX[dir]
  y += moveY[dir]
  houses.append((x, y))

sorted = [[x, houses.count(x)] for x in set(houses)]
print (len(sorted))

# Part 2
santaX = santaY = roboX = roboY = 0
houses = [ (0,0) ]

directions = open("day3_input.txt").read()

for i in range(len(directions)):
  if i % 2 == 0:
    santaX += moveX[directions[i]]
    santaY += moveY[directions[i]]
    houses.append( (santaX, santaY) )
  else:
    roboX += moveX[directions[i]]
    roboY += moveY[directions[i]]
    houses.append((roboX, roboY))

sorted = [[x, houses.count(x)] for x in set(houses)]
print (len(sorted))
