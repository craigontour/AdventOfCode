
input = open("day1_input.txt").read()

count = 0
for i in range(len(input)):
  if input[i] == '(':
    count += 1
  else:
    count -= 1
print("Part 1:", count)
    
count = 0
for i in range(len(input)):
  if input[i] == '(':
    count += 1
  else:
    count -= 1
  if count < 0:
    print("Part 2:", i+1)
    break
