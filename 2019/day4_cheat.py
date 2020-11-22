# List comprehensions
# https://www.reddit.com/r/adventofcode/comments/e5u5fv/2019_day_4_solutions/

lo, hi = 145852, 616942

# Part 1
strings = [str(s) for s in range(lo, hi+1)]
nodecrs = [s for s in strings if s == ''.join(sorted(list(s)))]
# print len(nodecrs)

repeats = [str(i)*2 for i in range(10)]
# print repeats

results = [s for s in nodecrs if any(d in s for d in repeats)]
print("Part 1:",len(results))

# Part 2
lo , hi = 145852 , 616942
strings = [str(s) for s in range(lo, hi + 1)]
nodecrs = [s for s in strings if s == ''.join(sorted(list(s)))]
repeats = [(str(i) * 2, str(i) * 3) for i in range(10)]
results = [s for s in nodecrs if any(d in s and not t in s for d, t in repeats)]
print("Part 2:",len(results))
