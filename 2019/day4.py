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

def check_facts2(n):
  # print(n)
  s = str(n)
  asc = True
  dups = [0 for a in range(10)]

  for i in range(len(s)):
    # print(i,s[i])

    dups[int(s[i])] += 1

    if i < len(s)-1:
      if s[i] > s[i+1]:
        asc = False
        break

  # print(dups)
  # print(2 in dups)

  return asc and (2 in dups)

# print(check_facts2(112233))
# print(check_facts2(123444))
# print(check_facts2(111122))

nums = []
for n in range(146810,612565):
  if check_facts2(n):
    nums.append(n)

print("Part 2 = ",len(nums))