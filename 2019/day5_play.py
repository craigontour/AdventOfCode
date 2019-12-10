
data = open('day5_input.txt').read().split(',')
data = [int(i) for i in data]

# Part 1

# test data
# data= [3,225,
# 1,225,6,6,
# 1101,1,238,225,
# 104,0,
# 99]

i = 0

while data[i] != 99:
  print "data i", data[i]
  opcode = data[i] % 10
  print "opcode=",opcode

  ps = str( (data[i] - (data[i]%10)) /10 ).zfill(3)
  print "params",ps

  if opcode == 1:
    # mode == 0
    # # data [ i+1 + i+2 -> i+3 ]
    # mode == 1
    # # i+1 + i+2 -> i+3
    i += 4
  elif opcode == 2:
    # mode == 0
    # # data [ i+1 * i+2 -> i+3 ]
    # mode == 1
    # # i+1 + i+2 -> i+3
    i += 4
  elif opcode == 3:
    i += 2
  elif opcode == 4:
    i += 2
  
  print i

  raw_input("?")
