# keywords: regex, array, dict

import re

test = 0
data = []
h = {}

if test:
  data = open("day7_test.txt").readlines()
else:
  data = open("day7_input.txt").readlines()

while len(data) > 0:
  line = data.pop(0).strip()
  # print("Line:", line)

  src = line.split(' -> ')[0].strip()
  dst = line.split(' -> ')[1].strip()

  # this is part 2
  if dst == 'b':
    src = '3176'

  if re.search(r"NOT", src):
    src = src.split(' ')[1]
    if h.get(src) != None:
      print(f"{len(data)}: {dst} = NOT {src}")
      h[dst]= 65536 + ~h[src]
    else:
      data.append(line)

  elif re.search(r"AND", src):
    l, op, r = src.split(' ')
    if re.search(r"^\d+$", l):
      if h.get(r) != None:
        print(f"{len(data)}: {dst} = {l} and {r} $$$$")
        h[dst] = int(l) & h[r]
      else:
        data.append(line)
    else:
      a = h.get(l)
      if h.get(l) != None and h.get(r) != None:
        print(f"{len(data)}: {dst} = {l} and {r} &*&*")
        h[dst] = h[l] & h[r]
      else:
        data.append(line)

  elif re.search(r"OR", src):
    l, op, r = src.split(' ')
    if h.get(l) != None and h.get(r) != None:
      print(f"{len(data)}: {dst} = {l} | {r}")
      h[dst] = h[l] | h[r]
    else:
      data.append(line)

  elif re.search(r"LSHIFT", src):
    l, op, r = src.split(' ')
    if h.get(l) != None:
      print(f"{len(data)}: {dst} = {l} << {r}")
      h[dst] = h[l] << int(r)
    else:
      data.append(line)

  elif re.search(r"RSHIFT", src):
    l, op, r = src.split(' ')
    if h.get(l) != None:
      print(f"{len(data)}: {dst} = {l} >> {r} @@@@@")
      h[dst] = h[l] >> int(r)
    else:
      data.append(line)

  else:
    if re.search("^\d+$",src):
      print(f"{len(data)}: {dst} = {src}")
      h[dst] = int(src)
    else:
      if h.get(src) != None:
        print(f"{len(data)}: {dst} = {src}")
        h[dst] = h[src]
      else:
        data.append(line)
        print("Put back:", line)

print("Part 2:", h.get('a'))

