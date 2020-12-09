
# groups = ARGF.read.split("\n\n").map(&:split)
# pp groups

# puts "Part 1:"
# puts groups.map { |group| group.join.chars.uniq.length }.sum

# puts "Part 2:"
# puts groups.map { |group| group.map(&:chars).reduce(:&).length }.sum

# # OR SIMILAR

# convert each chunk to an array of arrays of chars
customs = ARGF.read.split(/\n\n/).map do |chunk|
  chunk.split.map(&:chars)
end

pp customs

# part 1 -union
puts customs.map { |d| d.join.chars.uniq.length }.sum
puts customs.map { |chunk| chunk.reduce(:|).size }.sum

# part 2 -intersection
puts customs.map { |chunk| chunk.reduce(:&).size }.sum

# OR THIS ONLINER
puts "Part 1: Sweet one liner using inject..."
puts File.read('day6.tst').split("\n\n").inject(0) { |t, g|
  t += g.each_line(chomp: true)
          .map(&:chars)
          .flatten
          .uniq
          .count
  }
