# Day 10
# For each asteroid (#) in matrix:
# - get coord (x,y)
# - skip if coord is a multiple of another asteroid
# - else add 1 to count

input = File.readlines('day10_test1.txt').map(&:strip)[0].split(",")

input.each do |line|
  puts line
end
