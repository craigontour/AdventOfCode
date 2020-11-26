inp = '1113122113'

(1..50).each do |i|
  ans = ''
  inp.chars.chunk { |c| c }.each { |c, ch| ans += "#{ch.length}#{c}" }
  puts "#{i}" #": #{inp} => #{ans}"
  inp = ans
end

# Part 1: 40 times

# Part2: 50 times
puts inp.length
