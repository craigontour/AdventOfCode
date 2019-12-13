from math import degrees, pi, atan2
from operator import itemgetter

input = open('day10_test1.txt').read()

asteroids = list()
def get_asteroids(input):
  for y, row in enumerate(input.split('\n')):
    for x, col in enumerate(list(row)):
      if col == "#":
        asteroids.append((x, y))
  return asteroids

def angle(a,b):
  return degrees(atan2(b[0] - a[0], a[1] - b[1]) % (2 * pi))

def get_visible(asteroids, check):
    visible = set()
    for asteroid in asteroids:
        if asteroid == check:
            continue

        a = angle(check, asteroid)
        visible.add(a)

    return len(visible)

def get_most_visible(asteroid_map):
    most_visible = 0
    asteroids = None
    for asteroid in asteroid_map:
        visible = get_visible(asteroid_map, asteroid)
        most_visible = max(visible, most_visible)

    return most_visible

v = get_most_visible(get_asteroids(input))
print("Part 1 = ",v)

def destroy_asteroids(asteroids):
    visibles = [(a, get_visible(asteroids, a)) for a in asteroids]
    visibles.sort(key=itemgetter(1))
    print(visibles)
    # station = visibles[-1][0]
    # asteroids.remove(station)

destroy_asteroids(asteroids)


# ENUMERATE
# >>> for l in enumerate("hello"):
# ...   print(l)
# ... 
# (0, 'h')
# (1, 'e')
# (2, 'l')
# (3, 'l')
# (4, 'o')
