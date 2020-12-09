# keywords: chunk (size of chunks of data), map, join

input = '1113122113'

def main(loops, input)
  (1..loops).each do |_|
    input = input.chars.chunk { |c| c }.map { |c, ch| [ch.size, c] }.join
  end
  return input
end

# Part 1: 40 times
puts main(40, input).length

# Part2: 50 times
puts main(50, input).length

# DONT USE THIS FOR EACH LOOP, REASSIGNING THE STRING TAKES HOURS !!
    # ans = ''
    # inp.chars.chunk { |c| c }.each { |c, ch| ans += "#{ch.length}#{c}" }
    # puts "#{i}" #": #{inp} => #{ans}"
    # inp = ans
