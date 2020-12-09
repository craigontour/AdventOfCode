# keywords: =~, pattern matching

# Day 5
# Match for 3 vowels, at least 1 letter twice in a row, and
# does not contain ab, cd, pq, or xy

# test = 'ugknbfddgicrmopn'
# c = 0

data = File.readlines('Day5_input.txt')

# data.each do |line|
#     puts line
#     badMatch = false

#     ["ab", "cd", "pq", "xy"].each do | p |
#         if line.include?(p)
#             badMatch = true
#             break
#         end
#     end

#     if (/(.)\1/ =~ line) && !badMatch
#         if (line.count "aeiou") >= 3
#             c += 1
#         end
#     end
# end

# puts c

# PART 2

test = 'qjhvhtzxzqqjkmpb'
c = 0

data.each do |line|
  # puts line
  if line =~ /([a-z][a-z]).*\1/
    puts 'Pairs found'
    if line =~ /([a-z]).\1/
      puts "#{line.chomp} is nice"
      c += 1
    else
      puts "#{line.chomp} is naughty 2"
    end
  else
    puts "#{line.chomp} is naughty 1"
  end
end
puts c