# Day 1

def calc_fuel(mass):
  return(int(round(int(mass) / 3) - 2))

# Test
print(calc_fuel(1969))

# Part 1
fuel = 0
with open("day1_input.txt") as f:
  for mod in f:
    fuel += calc_fuel(mod)

print(fuel)

# Part 2
total_fuel = 0

def loop_fuel(fuel):
  other_fuel = 0
  while calc_fuel(fuel) > 0:
    fuel = calc_fuel(fuel)
    other_fuel += fuel
  return other_fuel

with open("day1_input.txt") as f:
  for mod in f:
    total_fuel += loop_fuel(mod)

print(total_fuel)