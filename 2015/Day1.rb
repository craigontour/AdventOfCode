# Day1
# input = ["()())"]
input = File.readlines('/Users/craig/Dev/AdventOfCode/2015/Day1_input.txt')
puts input[0].length
res = 0
pos = ''
for i in (1..input[0].length)
    if input[0][i-1] == '('
        res += 1
    elsif input[0][i-1] == ')'
        res -= 1
    else
        puts "End of input"
        exit
    end
    puts "i = " + i.to_s + "; res = " + res.to_s
    if res < 0 && pos == ''
        pos = i.to_s
        puts "Basement pos = #{pos}"
    end
end
puts res
