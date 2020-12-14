# keywords: modulo, prime, remainder
# Chinese Remainder Theorem: https://www.youtube.com/watch?v=zIFehsBHB8o

input = "23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,449,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,13,19,x,x,x,x,x,x,x,x,x,29,x,991,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,17"

tests = [
  [ "7,13,x,x,59,x,31,19", 1068788 ],
  [ "17,x,13,19", 3417],
  [ "67,7,59,61", 754018 ],
  [ "67,x,7,59,61", 779210 ],
  [ "67,7,x,59,61", 1261476 ],
  [ "1789,37,47,1889", 1202161486 ]
]

input = "7,13,x,x,59,x,31,19"


schedules = []
input.split(',').each_with_index do |sch, i| 
  schedules << [sch.to_i, i] if sch != 'x'
end
pp schedules

ts = 0 #100000000000000

# ts == 0 (mod 7)   # r = 0 as i = 0
# ts == 12 (mod 13) # r = 12 as (ts % mod) - 1
# ts == 55 (mod 59) # r = 55 as (ts % mod) - 4
# ts == 25 (mod 31) # r = 19 as (ts % mod) - 6
# ts == 12 (mod 19)  # r = 5 as (ts % mod) - 7


def modInverse(a, m)
  a = a % m
  for x in 1..m do
    if ((a * x) % m == 1)
      return x
    end
  end
  return 1
end

# N = (sum of mods), ni = N / (mod of bi)
N = schedules.map { |mod, _| mod }.reduce(:*)
pp N

nobus = true
t = 1050000
while t < 1068790 do
  x = 0
  schedules.map do |mod, i|
    bi = (t + i) % mod
    ni = N / mod
    xi = modInverse((N/mod), mod)
    x += bi * ni * xi
    pp "t: #{t}, bi: #{bi}, ni: #{ni}, xi: #{xi}, x: #{x}"
  end
    # nobus = false if x == ts
  t += 1
end
