# Keywords: assert tuple intesection set array
# Cheat
# https://www.reddit.com/r/adventofcode/comments/e5bz2w/2019_day_3_solutions/f9iz68s?utm_source=share&utm_medium=web2x

A,B,_ = open('day3_input.txt').read().split('\n')
A,B = [x.split(',') for x in [A,B]]

DX = {'L': -1, 'R': 1, 'U': 0, 'D': 0}
DY = {'L': 0, 'R': 0, 'U': 1, 'D': -1}

def get_points(A):
  x = 0
  y = 0
  length = 0
  ans = {}
  for cmd in A:
    # print(cmd[0],cmd[1:])
    d = cmd[0]
    n = int(cmd[1:])

    # AssertionError if letter is invalid
    assert d in ['L', 'R', 'U', 'D']

    # for each point in direction d check if in ans array
    for _ in range(n):
      x += DX[d]
      y += DY[d]
      # print(x,y)

      length += 1  # this is clever, distance to 0,0

      if (x,y) not in ans:
        ans[(x,y)] = length

  return ans

PA = get_points(A)
PB = get_points(B)

# & is same as intersection
# both = set(PA.keys()).intersection(set(PB.keys()))

both = set(PA.keys()) & set(PB.keys())
print(both)

# Part 1
part1 = min([abs(x)+abs(y) for (x,y) in both])
print(part1)

# Part 2
print(min(PA[p]+PB[p] for p in both))
