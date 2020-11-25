require 'pp'
# data = File.readlines("Day8_input.txt")
data = File.readlines("Day8_test.txt")
lines = data.length
chars = 0
newchars = 0
encoded = 0

# Thanks to packrat386 for simplificiation of using eval at
# https://www.reddit.com/r/adventofcode/comments/3vw32y/day_8_solutions/
data.each do |l|
  l.chomp!
  chars += l.length
  # puts "#{l} => #{l.inspect}"
  newchars += eval(l).size
  encoded += l.inspect.size
end

puts "Part 1:"
pp "total characters   = #{chars}"
pp "new characters     = #{newchars}"
pp "encoded characters = #{encoded}"

puts chars-newchars

# Part 2


puts "Part 1:"
