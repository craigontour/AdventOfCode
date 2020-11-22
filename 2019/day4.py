# 6 digit number

# Part 1
def check_facts1(n):
  s = str(n)

  asc = True
  neigh = False

  for i in range(len(s)-1):
    if s[i] > s[i+1]:
      asc = False
      break
    if s[i] == s[i+1]:
      neigh = True

  return asc and neigh

nums = []
for n in range(146810,612565):
  if check_facts1(n):
    nums.append(n)

print("Part 1 = ",len(nums))

# Part 2
def check_facts1(n):
  s = str(n)
  dups = [0 for a in range(10)]
  asc = True
  
  for i in range(len(s)):
    # this works because numbers are ordered
    dups[int(s[i])] += 1
  
  for i in range(len(s)-1):
    if s[i] > s[i+1]:
      asc = False
      break

  return asc and (2 in dups)

def check_facts2(n):
  s = str(n)
  asc = True
  dups = [0 for a in range(10)]
  
  for i in range(len(s)):
    # this works because numbers are ordered
    dups[int(s[i])] += 1

    # if i < len(s)-1:
    #   if s[i] > s[i+1]:
    #     asc = False
    #     break

  for i in range(len(s)-1):
    if s[i] > s[i+1]:
      asc = False
      break

  return asc and (2 in dups)

# print(check_facts2(112233))
# print(check_facts2(123444))
# print(check_facts2(111122))

nums = []
for n in range(146810,612565):
  # if check_facts1(n):
  #   print("Part1 :",n) #nums.append(n)
  if check_facts2(n):
    nums.append(n)

print("Part 2 = ",len(nums))
