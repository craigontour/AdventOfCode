# keywords: zip, collection, map
import collections

input = open('day10.tst', 'r').readlines()
input = [1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19]

js = sorted(map(int, input))
js = [0] + js + [js[-1] + 3]

# for j1, j2 in zip(js, js[1:]):
#   print("j1:",j1,"j2:",j2,"j2-j1",j2-j1)

cnt = collections.Counter(j2 - j1 for j1, j2 in zip(js, js[1:]))
# print("Part 1:", cnt[1] * cnt[3])

dp = [1] + [0] * (len(js) - 1)
print("js:",js)
print("dp:",dp)
print()

for i, j in enumerate(js):
  print("i:",i,"j:",j)

  print(range(i - 3, i))
  exit()

  for l in range(i - 3, i):
    print("  l:",l,"js[l]:",js[l])

    if j - js[l] <= 3:
        dp[i] += dp[l]
    print(dp)
    print()

exit()

print(dp[-1])
