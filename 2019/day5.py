# Day 5
debug = True

data = open('day5_input.txt').read().split(',')
data = [int(i) for i in data]

# Part 1

# test data
# data= [3,9,8,9,10,9,4,9,99,-1,8]
# data = [1101,100,-1,4,0]
# data = [1002,4,3,4,33]

##############   Functions   ##############

def get_modes(op):
  m1 = (op / 100) % 10
  m2 = (op / 1000) % 10
  m3 = (op / 10000) % 10
  return [m1, m2, m3]
 
def resolvep(modes, n, params):
  if modes[n] == 0:
    return data[params[n]]
  else:
    return params[n]

def op1(modes, params):
  data[params[2]] = resolvep(modes, 0, params) + resolvep(modes, 1, params)

def op2(modes, params):
  data[params[2]] = resolvep(modes, 0, params) * resolvep(modes, 1, params)

def op3(modes, i):
  data[data[i+1]] = input

def op4(modes, params):
  return resolvep(modes, 0, params)

def op5(modes, params, i):
  if (resolvep(modes, 0, params) != 0):
    return resolvep(modes, 1, params)
  else:
    return i + 3

def op6(modes, params, i):
  if (resolvep(modes, 0, params) == 0):
    return resolvep(modes, 1, params)
  else:
    return i + 3

def op7(modes, params):
  if resolvep(modes, 0, params) < resolvep(modes, 1, params):
    data[params[2]] = 1
  else:
    data[params[2]] = 0

def op8(modes, params):
  if resolvep(modes, 0, params) == resolvep(modes, 1, params):
    data[params[2]] = 1
  else:
    data[params[2]] = 0
 
##############  Main Program  ##############

def main(i, input):

  while data[i] != 99:
    print ""
    print "data 00-09:   ",data[0:10]
    print "data 10-19:   ",data[10:20]
    print "data 20-29:   ",data[20:30]
    print "data 30-39:   ",data[30:40]
    print "data 40-49:   ",data[40:50]

    next_batch = data[i:i+4]

    opcode = next_batch[0] % 100
    if debug: print "Opcode: ", opcode
        
    next_batch = data[i:i+4]
    if debug: print "Params: ", data[i+1:i+4]

    modes = get_modes(next_batch[0])
    if debug: print "Modes: ", modes

    print "before: i, input = ", i, input
    if debug: print data[i+1:i+11]

    if opcode == 1:
      op1(modes, data[i+1:i+4])
      i += 4
    elif opcode == 2:
      op2(modes, data[i+1:i+4])
      i += 4
    elif opcode == 3:
      op3(modes, i)
      i += 2
    elif opcode == 4:
      input = op4(modes, data[i+1:i+4])
      i += 2
    elif opcode == 5:
      print "op5-before: i is now", i
      print "modes[0], pos, imm = ", modes[0], data[data[i+1]], data[i+1]
      i = op5(modes, data[i+1:i+3], i)
      print "op5-after: i is now", i
    elif opcode == 6:
      i = op6(modes, data[i+1:i+3], i)
    elif opcode == 7:
      op7(modes, data[i+1:i+4])
      i += 4
    elif opcode == 8:
      print "op8-before: i is now", i
      op8(modes, data[i+1:i+4])
      i += 4
      print "op8-after: i is now", i
    else:
      print("It's all gone wrong",opcode)
      data[i] = 99

    if debug:
      print "after i, input = ", i, input
      print ''
      a = raw_input('pause...')
      if a == 'x':
        data[i] = 99
        input = -1

  return input

i = 0
input = 1
# print("Part 1 = ",main(i, input))

# Part 2
data = open('day5_input.txt').read().split(',')
data = [int(i) for i in data]

# Test
data = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]

i = 0
input = 8
print("Part 2 = ",main(i, input))
