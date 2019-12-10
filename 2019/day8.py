# day 8
TEST = False
DEBUG = False

# process file as layers of (25*6 = 150) pixels
data = open('day8_input.txt').read().split(',')
if TEST: data = ['123456789012']
data = [int(i) for i in data[0]]

PX = 25
PY = 6
PPL = PX * PY
if TEST: PPL = 3 * 2
if DEBUG:
  print len(data)
  print len(data) / PPL

def print_the_layer(layer, mode):
  for y in range(PY): # 0 1 2 3 4 5
    s = ''
    for x in range(PX): # 0 to 24
      if mode == 0:
        s += str(layer[x+(y*PX)])
      else:
        if layer[x+(y*PX)] == 1:
          s += '#'
        else:
          s += ' '
    print s

def print_a_line(layer, lineno):
  s = ''
  for x in range(PX): # 0 to 24
    s += str(layer[x+(lineno*PX)])
  print s

i = 0
layers = []
current = [0, 150, 0, 0]
while (i*PPL) < len(data):
  layer = [data[i*PPL:(i*PPL)+PPL]]
  layers += layer
  # print "count 0s: ", i, layers[i].count(0)
  if layers[i].count(0) < current[1]:
    current[0] = i
    current[1] = layers[i].count(0)
    current[2] = layers[i].count(1)
    current[3] = layers[i].count(2)
  i += 1
  # raw_input('pause .. ')

print("Part 1 =",current[2] * current[3])

# Part 2

m = layers[0]
# print_the_layer(m,0)

for l in layers:
  for y in range(PY):
    s = ''
    for x in range(PX):
      coord = (y*PX) + x
      if m[coord] == 2 and l[coord] < 2:
        m[coord] = l[coord]

# Read the output on screen
print_the_layer(m,1)
