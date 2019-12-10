# Input
# input = File.readlines('Day9_input.txt')
# Test data
input = File.readlines('Day9_test.txt')
players, last, answer = input[0].split(" ").each.map(&:to_i)

puts players
puts last
puts answer, ''

circle = []
scores = []
(0..last).each do |i|
  scores[i] = 0
end

for i in (0..last)
  circle << i

  if i % 9 == 0
    j = 9
  else
    j = i % 9
  end

  if i % 23 == 0
    scores[j] = i
  else
    puts i.to_s + ', ' + j.to_s
  end

  
end

puts '--------------------------------'
puts scores
puts '--------------------------------'
puts scores.each_with_index.max[1]
