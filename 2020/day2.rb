# keywords: regex match/captures, count

one = two = 0
data = File.readlines('day2.txt')

# data = [ '1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc' ]

data.each do |line|
  a, b, c, passwd = line.match('(\d+)-(\d+).([a-z]):\s([a-z]+)').captures
  # puts "From:#{a} to:#{b} include:#{c} in:#{d}"
  one += 1 if passwd.count(c) >= a.to_i && passwd.count(c) <= b.to_i
  two += 1 if ((passwd[a.to_i-1] == c) && !(passwd[b.to_i-1] == c)) || (!(passwd[a.to_i-1] == c) && (passwd[b.to_i-1] == c))
end
puts "part 1: #{one}"
puts "Part 2: #{two}"
