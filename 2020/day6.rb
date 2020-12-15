# action: finds out how many common chars across multiple lines
# purpose: split file by double line ending and then by \n
# keywords: array, interpolation, string uniq character count, skip blank line

f = 'day6.txt'
i = part1 = part2 = 0
r = ''
r2 = []

input = File.readlines(f)

class String
  def intersection(other)
    self.split('') & other.split('')
  end
end

input.each do |l|
  i += 1
  line = l.chomp

  if line.length > 0
    r += line 
    r2 << line
  end

  if (line.length == 0) || (i == input.length)
    part1 += r.chars.sort.uniq.length
    
    # puts "r2:#{r2}"

    r = ''
    r2 = []
    next
  end
end
puts "Part 1 Me: #{part1}"

FORMS = File.read('Day6.txt').split("\n\n")

FORMS.inject(0) do |part1, g|
  part1 += g.each_line(chomp: true).map(&:chars).flatten.uniq.count
end
puts "Part 1 v2: #{part1}"

exit()

# Part 1 - one line!!
require 'set'  # << what is this?
part1 = FORMS.map { |group| group.gsub("\n", '').split('').to_set.length }.reduce(:+)
puts "Part 1 v2: #{part1}"


# Couldn't work out how to find out common characters in each group
# Solution from Reddit.

# A simple way to read into groups every \n\n
# members = []
# groups = File.open(f).read().split("\n\n")

# Part 2

# FORMS.inject(0) do |part1, g| 
#   part1 += g.each_line(chomp: true).map(&:chars).flatten.uniq.count
# end
# puts "Part 1 v2: #{part1}"

# # Part 1 - one line!!
# require 'set'  # << what is this?
# part1 = FORMS.map { |group| group.gsub("\n", '').split('').to_set.length }.reduce(:+)
# puts "Part 1 v2: #{part1}"


# pp members

# puts "Part 2:"