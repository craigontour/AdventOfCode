# keywords: regex

import re

pstr = ''
passports = []
c = 0

data = open('day4.txt').readlines()

for line in data:
  
  if len(line.strip()) != 0:
    pstr += line.strip() + ' '
  
  if len(line.strip()) == 0 or c == len(data)-1:
    # remove extraneous line feed
    pstr = pstr[0:(len(pstr)-1)]

    # create new dict for password k, v pairs
    passport = {}

    # get info elements in passport
    for el in pstr.split(' '):
      # get k, v pairs and add to dict
      k = el.split(":")[0]
      v = el.split(":")[1]
      passport[k] = v

    # Part 1 criteria for valid passport
    if len(passport) == 8:
      passports.append(passport)
      print("Valid passport = ", passport)
      input()
    elif len(passport) == 7 and passport.get('cid') != None:
      passports.append(passport)
      print("Valid passport = ", passport)
      input()

    pstr = ''

  c += 1

print("Part 1:", len(passports))
# ANSWER IS WRONG!!!!
