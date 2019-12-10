# Day 6 - recursion tree traversal set array intersection

# Except Centre of Mass
# Every object in space orbits one other object
# AAA)BBB means BBB orbits AAA

# https://www.reddit.com/r/adventofcode/comments/e6tyva/2019_day_6_solutions/
# Solution by vodak

# Part 1
# orbits = { x[4:]:x[0:3] for x in open('day6_test.txt').read().split('\n') }
orbits = { x[4:]:x[0:3] for x in open('day6_input.txt').read().split('\n') }

orbit_count = 0

print orbits

for orbiting_object in orbits.keys():
  # print orbiting_object
  # print orbits[orbiting_object]
  
  while orbiting_object in orbits:
    orbit_count += 1
    orbiting_object = orbits[orbiting_object]
    # print orbiting_object
    # print (orbiting_object in orbits)

    # raw_input('pause..')

print('Part 1 =', orbit_count)

you_orbit = 'YOU'
you_orbits = []
while you_orbit in orbits:
  you_orbits.append(orbits[you_orbit])
  you_orbit = orbits[you_orbit]
# print you_orbits

san_orbit = 'SAN'
san_orbits = []
while san_orbit in orbits:
  san_orbits.append(orbits[san_orbit])
  san_orbit = orbits[san_orbit]
# print san_orbits

print('Part 2 =',len(you_orbits) - len(set(you_orbits) & set(san_orbits)) + len(san_orbits) - len(set(you_orbits) & set(san_orbits)))
