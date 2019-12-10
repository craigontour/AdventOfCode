########### INPUT
# Step C must be finished before step A can begin.
# Step C must be finished before step F can begin.
# Step A must be finished before step B can begin.
# Step A must be finished before step D can begin.
# Step B must be finished before step E can begin.
# Step D must be finished before step E can begin.
# Step F must be finished before step E can begin.

h = {}
File.readlines('Day7_test.txt').each do |l|
  i, j = l[36], l[5]
  h[i] ||= []
  h[j] ||= []
  h[i] << j
end
# puts h

f = ''
until h.empty?
  e = h.select {|k,v| v.empty?}.keys.sort[0]
  h.delete(e)
  h.each {|k,v| v.delete(e)}
  f += e
  # puts h
end

# Answer = C A B D F E
puts "Part 1 Answer is '" + f + "'"
puts

####################### PART 2 ######################

puts "Part 2."

a = { "A" => 1, "B"=>2, "C"=>3, "D"=>4, "E"=>5, "F"=>6 }
puts a
