
input = []
for line in open('day3.txt', 'r'):
  input.append(line.strip())

def countTrees(input, slopes):
  w = len(input[0])
  treecount = 1

  for s in slopes:
    x = y = trees = 0
    for i in range(len(input)):
      if y == i:
        # print("i:",i,"x:",x,"y:",y,"w:",w,"l:",input[i],"=",input[i][x % w])
        trees += input[i][x % w] == '#'
        x += s[0]
        y += s[1]
    treecount *= trees

  return treecount

print("Part 1:", countTrees(input, [ [3,1] ]))
print("Part 2:", countTrees(input, [ [1,1], [3,1], [5,1], [7,1], [1,2] ]))
