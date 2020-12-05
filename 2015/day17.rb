# keywords: combination, reduce, group
nums = File.open('day17.txt').readlines().each.map(&:to_i)

# nums = [ 20, 15, 10, 5, 5 ]
qty = 150
combos = []

(1..(nums.length-1)).each do |i|
  # puts "Combinations for #{i}"
  nums.combination(i).each do |combo|
    combos << combo if combo.reduce(:+) == qty
    # puts combos
  end
end

pp "Part 1: #{combos.length}"
pp "Part 2: ?"
combos.group_by(&:size).each { |k,v| puts "#{k} containers, used #{v.length} times" }

# https://www.reddit.com/r/adventofcode/comments/3x6cyr/day_17_solutions/
m = combos.map(&:size).min
pp combos.count { |x| x.size == m }
