# keywords: py, regex, findall
import re

input = open('day19.txt').read()
# print(input)

molecule = 'CRnSiRnCaPTiMgYCaPTiRnFArSiThFArCaSiThSiThPBCaCaSiRnSiRnTiTiMgArPBCaPMgYPTiRnFArFArCaSiRnBPMgArPRnCaPTiRnFArCaSiThCaCaFArPBCaCaPTiTiRnFArCaSiRnSiAlYSiThRnFArArCaSiRnBFArCaCaSiRnSiThCaCaCaFYCaPTiBCaSiThCaSiThPMgArSiRnCaPBFYCaCaFArCaCaCaCaSiThCaSiRnPRnFArPBSiThPRnFArSiRnMgArCaFYFArCaSiRnSiAlArTiTiTiTiTiTiTiRnPMgArPTiTiTiBSiRnSiAlArTiTiRnPMgArCaFYBPBPTiRnSiRnMgArSiThCaFArCaSiThFArPRnFArCaSiRnTiBSiThSiRnSiAlYCaFArPRnFArSiThCaFArCaCaSiThCaCaCaSiRnPRnCaFArFYPMgArCaPBCaPBSiRnFYPBCaFArCaSiAl'

# https://www.reddit.com/r/adventofcode/comments/3xflz8/day_19_solutions/

results = []

# semi225599
replacements = re.findall(r'(\w+) => (\w+)', input)

# kaldonis - this is the logic I was trying to implement
for key, value in replacements:
  for i in range(len(molecule)):
    if key in molecule[i:]:
      results.append(molecule[:i] + molecule[i:].replace(key, value, 1))

print(len(set(results)))
