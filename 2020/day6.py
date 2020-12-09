# keyword: blank line

f = 'day6.tst'
part1 = part2 = 0
r = ''
i = 0

input = open(f, 'r').readlines()

for line in input:
  i += 1
  # print("i:",i,"line:",line,"line:",len(line.strip()))
  
  r += line.strip()

  if (len(line.strip()) == 0) or (i == len(input)):
    part1 += len(''.join(set(r)))
    # print("r:",r,"len:",len(r),"c:",c)
    r = ''
    continue

print("Part 1:", part1)

r = []
i = 0
for line in input:
  i += 1
  
  r.append(line.strip())

  if (len(line.strip()) == 0) or (i == len(input)):
    print(r)
    for c in r.permutations:
      
    r = []
    continue

print("Part 2:", part2)
