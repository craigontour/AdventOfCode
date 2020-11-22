
arr = [112233, 123444, 111122]

strings = [str(s) for s in arr]
# ['112233', '123444', '111122']
print(strings)

nodecrs = [s for s in strings if s == ''.join(sorted(list(s)))]
# ['112233', '123444', '111122']
print(nodecrs)

repeats1 = [str(i) * 2 for i in range(10)]
print(repeats1)

repeats = [(str(i) * 2, str(i) * 3) for i in range(10)]
# [('00', '000'), ('11', '111'), ('22', '222'), ('33', '333'), ('44', '444'), ('55', '555'), ('66', '666'), ('77', '777'), ('88', '888'), ('99', '999')]

# results = [s for s in nodecrs if any(d in s for d in repeats1)]
s = '112233'
results = [d in s for d in repeats1]
print(results)
