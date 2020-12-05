# keywords: hash/dict, array

import numpy as np

racers = {}

for j in open("Day14_input.txt"):
  parts = j.strip().split(' ')
  who = parts[0]
  km = int(parts[3])
  flyfor = int(parts[6])
  rest = int(parts[13])
  racers[who] = { 'km':km, 'flyfor':flyfor, 'rest':rest, 'next':1, 'score':0, 'dist':0 }

# for racer in racers:
#   print(racer,":",racers[racer])

def getNext(sec, r):
  if sec <= r['flyfor']:
    x = y = sec % r['flyfor']
  else:
    x = int(sec / (r['flyfor'] + r['rest']))
    y = (sec - ((r['flyfor'] + r['rest']) * x)) % r['flyfor']
  if y == 0:
    return r['rest'] + 1
  else:
    return 1

sec = 1
while sec < 20:

  for r in racers:
    racer = racers[r]
    if sec == racer['next']:
      racer['dist'] += racer['km']    
      racer['next'] += getNext(sec, racer)

  d = []
  for r in racers: 
    d.append(racers[r]['dist'])
  print('d:', d)

  for v in racers.values():
    print("values:", v)
  # input()
  sec += 1
  exit()

print(racers['Dancer'])