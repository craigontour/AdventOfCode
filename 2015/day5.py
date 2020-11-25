import re

test = ['ugknbfddgicrmopn']

nice = 0

for line in open("day5_input.txt").readlines():

  if 'ab' in line or 'cd' in line or 'pq' in line or 'xy' in line:
    continue

  for char in line:
    if line.count(char + char) > 0:
      if line.count('a')+line.count('e')+line.count('i')+line.count('o')+line.count('u') >= 3:
        nice += 1
        break
    
    else:
      continue

print("Part 1:", nice)

# Part 2

test = ['qjhvhtzxzqqjkmpb']
nice = 0

for line in open("day5_input.txt").readlines():
  if re.search(rf"([a-z]).\1", line) and re.search(rf"([a-z][a-z]).*\1", line):
    nice += 1

print("Part 2:", nice)
