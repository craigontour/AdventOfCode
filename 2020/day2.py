import re

data = open('day2.txt', 'r')

# data = [ '1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc' ]
part1 = part2 = 0

for line in data:
  for a, b, c, passwd in re.findall(re.compile(r'(\d+)-(\d+).([a-z]):\s([a-z]+)'), line):
      # print(passwd,"contains",passwd.count(c),"c's","must be >=",a,"<=",b)
      if (passwd.count(c) >= int(a)) and (passwd.count(c) <= int(b)): part1 += 1
      if ((c == passwd[int(a)-1]) and (c != passwd[int(b)-1])) or ((c != passwd[int(a)-1]) and (c == passwd[int(b)-1])): part2 += 1

print("Part 1:", part1)
print("Part 2:", part2)
