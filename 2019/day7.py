# Day 7
debug = False

data = open('day7_input.txt').read().split(',')
data = [int(i) for i in data]

# Part 1

# test data
# data= [3,9,8,9,10,9,4,9,99,-1,8]

##############   Functions   ##############

def get_params(op):
  p1 = (op / 100) % 10
  p2 = (op / 1000) % 10
  p3 = (op / 10000) % 10
  return [p1, p2, p3]

def set_nums(p,nums):
  if p[0] == 0:
    n0 = data[nums[0]]
  else:
    n0 = nums[0]

  if p[1] == 0:
    n1 = data[nums[1]]
  else:
    n1 = nums[1]
  
  if p[2] == 0:
    n2 = nums[2]
  else:
    n2 = data[nums[2]]

  return [n0, n1, n2]
 
def op1(nums):
  if debug: print("add: c = a + b", nums)
  data[nums[2]] = nums[0] + nums[1]

def op2(nums):
  if debug: print("multiply: c = a * b", nums)
  data[nums[2]] = nums[0] * nums[1]

def op3(p, i):
  if p[0] == 0:
    data[data[i+1]] = input
  elif p[0] == 1:
    data[i+1] = input

def op4(p, n):
  return data[n] if p[0] == 0 else n

def op5(p, nums, i):
  if debug: print("jump_true: ", nums, i)

  if p[0] == 0:
    n0 = data[nums[0]]
  else:
    n0 = nums[0]
    
  if p[1] == 0:
    n1 = data[nums[1]]
  else:
    n1 = nums[1]
  # if debug: print('ns= ',n0,n1)

  if (n0 != 0):
    i = n1
    if debug: print('jumptrue: !=0 ', n0, i)
  else:
    i += 3
    if debug: print('jumptrue: ==0 ', i)

  return i

def op6(p, nums, i):
  if debug: print("jump_false: ", nums, i)

  if p[0] == 0:
    n0 = data[nums[0]]
  else:
    n0 = nums[0]
    
  if p[1] == 0:
    n1 = data[nums[1]]
  else:
    n1 = nums[1]
  # if debug: print('ns= ',n0,n1)

  if (n0 == 0):
    i = n1
    if debug: print('jumptrue: !=0 ', n0, i)
  else:
    i += 3
    
  return i

def op7(p, nums):
  # if debug: print('lessthan: params=',p)
  # if debug: print('lessthan: nums=',nums)

  if p[0] == 0:
    n0 = data[nums[0]]
  else:
    n0 = nums[0]
    
  if p[1] == 0:
    n1 = data[nums[1]]
  else:
    n1 = nums[1]

  if (n0 < n1):
    data[nums[2]] = 1
  else:
    data[nums[2]] = 0

def op8(p, nums):
  # if debug: print('equals: params=',p)
  # if debug: print('equals: nums=',nums)

  if p[0] == 0:
    n0 = data[nums[0]]
  else:
    n0 = nums[0]
    
  if p[1] == 0:
    n1 = data[nums[1]]
  else:
    n1 = nums[1]
  
  if (n0 == n1):
    # if debug: print('== ',n0,n1,n2)
    data[nums[2]] = 1
  else:
    # if debug: print('!= ',n0,n1,n2)
    data[nums[2]] = 0
 
##############  Main Program  ##############

def main(i, input):

  while data[i] != 99:

    next_batch = data[i:i+4]
    p = get_params(next_batch[0])
    opcode = next_batch[0] % 100

    if opcode == 1:
      op1(set_nums(p, data[i+1:i+4]))
      i += 4
    elif opcode == 2:
      op2(set_nums(p, data[i+1:i+4]))
      i += 4
    elif opcode == 3:
      op3(p, i)
      i += 2
    elif opcode == 4:
      input = op4(p, data[i+1])
      i += 2
    elif opcode == 5:
      i = op5(p, data[i+1:i+3], i)
    elif opcode == 6:
      i = op6(p, data[i+1:i+3], i)
    elif opcode == 7:
      op7(p, data[i+1:i+4])
      i += 4
    elif opcode == 8:
      op8(p, data[i+1:i+4])
      i += 4
    else:
      print("It's all gone wrong",opcode)
      data[i] = 99

  return input

i = 0
input = 0
print("Amp A = ",main(i, input))
