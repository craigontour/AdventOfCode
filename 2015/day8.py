import re
import numpy as np

test = 1
data = []

# https://www.reddit.com/r/adventofcode/comments/3vw32y/day_8_solutions/

# Part 1
# print( sum(len(line[:-1]) for line in open("day8_input.txt")) - 
# sum(len(eval(line)) for line in open("day8_input.txt")) )
s=0
# Part 2
for line in open("day8_input.txt"):
  # print(line.strip())
  # print(line.count('"'))
  # print(line.count('\\'))
  l = line.strip().replace('\\','\\\\').replace('"','\\"')
  # print(len(line.replace('\\','\\\\').replace('"','\\"')))
  # print("line:", line, "=>", l, "=", len(l))
  s += len(l) + 2 - len(line.strip())

print(s)

# My failed attempt

# if test:
#   data = open("day8_test.txt").readlines()
# else:
#   data = open("day8_input.txt", "rb").readlines()

# chars = 0
# code = 0

# for line in data:  
#   s = line.strip()
#   print("s:", s)
  
#   code += len(s.strip())

#   s2 = s.replace('\\\\', '\\').replace('\\"','"')
#   # print("s2:", s2)

#   if len(s2) > 2:
#     s3 = re.search(r"\\x\d\d", s2)
#     if s3 != None:
#       s4 = s2[s3.span()[0]+2:s3.span()[1]]
#       print("s3 group:", s3.group(), "s4:", s4)
#       s5 = s2.replace(s3.group(), bytearray.fromhex(s4).decode())
#     else:
#       s5 = s2
#     # print("s5:", s5)

#     s6 = s5[1:len(s5)-1]
#   else:
#     s6 = ""
  
#   # print("s6:", s6)
#   chars += len(s6)
#   # print('           ')

# print(code)
# print(chars)
# print(code-chars)