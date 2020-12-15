
# groups = ARGF.read.split("\n\n").map(&:split)
# pp groups

# puts "Part 1:"
# puts groups.map { |group| group.join.chars.uniq.length }.sum

# puts "Part 2:"
# puts groups.map { |group| group.map(&:chars).reduce(:&).length }.sum

# # OR SIMILAR

# convert each 'group' to an array of arrays of chars
customs = ARGF.read.split(/\n\n/).map do |d|
  pp d.split.map(&:chars)
end

exit()

# part 1 -union
puts customs.map { |d| d.reduce(:|).size }.sum

# part 2 -intersection
puts customs.map { |d| d.reduce(:&).size }.sum


# OR THIS ONLINER
puts "Part 1: Sweet one liner using inject..."
puts File.read('day6.tst').split("\n\n").inject(0) { |t, g|
  t += g.each_line(chomp: true)
          .map(&:chars)
          .flatten
          .uniq
          .count
  }

  # INJECT https://stackoverflow.com/questions/710501/need-a-simple-explanation-of-the-inject-method
  # You can think of the first block argument as an accumulator: 
  # the result of each run of the block is stored in the 
  # accumulator and then passed to the next execution of the 
  # block. In the case of the code shown above, you are defaulting 
  # the accumulator, result, to 0. Each run of the block adds the
  # given number to the current total and then stores the result 
  # back into the accumulator. The next block call has this new 
  # value, adds to it, stores it again, and repeats.
