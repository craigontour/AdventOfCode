# Day 1

lines = File.read('Day1_test.txt')
# lines = File.read('Day1_input.txt')

def calc_fuel(mod)
  mod / 3 - 2
end

# Part 1
part1 = 0
lines.each_line { |line|
  part1 += calc_fuel(line.to_i)
}
puts "Part 1 = #{part1}"

# Part 2
part2 = 0

# Test data
lines.each_line { |line|
  fuel = calc_fuel(line.to_i)
  puts "fuel = #{fuel}"
  part2 += fuel
  while fuel > 0 do
    fuel = calc_fuel(fuel.to_i)
    part2 += fuel
  end
}
puts "Part 2 = #{part2}"