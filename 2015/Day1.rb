# Day1
# input = ["()())"]
input = File.readlines('Day1_input.txt')

# Part 1
count = 0
input[0].chars.each do |c|
  if c =~ /\(/
    count += 1
  else
    count -= 1
  end
end
puts count

# Part 2
count = 0
input[0].chars.each_with_index do |c, i|
  if c =~ /\(/
    count += 1
  else
    count -= 1
  end
  # In the basement
  if count < 0
    puts i + 1
    exit
  end
end

# My first attempt
# res = 0
# pos = ''
# (1..input[0].length).each do |i|
#   if input[0][i - 1] == '('
#     res += 1
#   elsif input[0][i - 1] == ')'
#     res -= 1
#   end

#   puts "i = #{i.to_s}; res = #{res.to_s}"

#   if res < 0 && pos == ''
#     pos = i.to_s
#     puts "Basement pos = #{pos}"
#   end
# end

# puts res
