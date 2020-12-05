# keywords: json, json.loads, dict

import json

def n(j):
  print(type(j))
  if type(j) == int:
    print(j)
    input()
    return j
  if type(j) == list:
    print(j)
    input()
    return sum([n(j) for j in j])
  if type(j) != dict:
    print(j)
    input()
    return 0
  if 'red' in j.values():
    print(j.values())
    input()
    return 0
  return n(list(j.values()))

input = json.loads(open('Day12_input.txt', 'r').read())

n(input)
