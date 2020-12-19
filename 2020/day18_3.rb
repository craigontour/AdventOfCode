
# Debugging
def prompt
  r = readline()
  exit() if r == "x\n"
end

@debug = false
input = File.open('day18.tst').readlines()
total = 0

def calcSum(cs)
  op = ''
  sum = 0
  
  puts "cs: #{cs}"

  i = 0
  while i < cs.length do
    c = cs[i]
    stack = []
    expr = ''
    
    puts "i:#{i}, c:#{c}, op:#{op}, sum:#{sum}"

    if c == ' '
      i += 1
    elsif c == '+' || c == '*'
      op = c
      i += 1
    elsif  c =~ /\(/
      s = 0

      if cs.scan(/\(\d\s[*+]\s\d\)/) != []
        puts "1 @ #{Regexp.last_match.offset(0).first}"
        m = cs.match(/(\(\d\s[*+]\s\d\))/).captures[0]
        # update i to length of match
      elsif cs.scan(/\(\d[\s+*\d]+[^()]\)/) != []
        puts "m  @ #{Regexp.last_match.offset(0).first}"
        m = cs.match(/(\(\d[\s+*\d]+[^()]\))/).captures[0]
      end
      puts "match: #{m}"
      prompt

      # m = cs[i..(cs.length-1)].match(/(\(.*\))/).captures[0]
      puts "calcSum   : #{m[1..-2]}"

      i += m.length
      rest = cs[i..(cs.length-1)]
      puts "rest      : #{rest}"
      
      s = calcSum(m[1..-2])
      puts "I'm back!! - s = #{s}"
      if op == ''
        sum = s
      else
        puts "sum = eval #{sum} #{op} #{s}"
        sum = eval("#{sum} #{op} #{s}")
      end
      puts "sum is #{sum} and return"

    elsif c =~ /\)/
      puts "Closed bracket should be handled above."
      i += 1
    elsif c =~ /\d+/  # evaluate "sum op c"
      if op == ''
        sum = c.to_i
      else
        prev = sum
        sum = eval "#{sum} #{op} #{c.to_i}"
        puts "num: #{prev} #{op} #{c.to_i} = #{sum}" if @debug
        op = ''         # reset op
      end
      i += 1
    end
  end
  return sum
end

input.each do |line|
  calc = calcSum(line.chomp)
  puts "sum of #{line.chomp} = #{calc}"
  prompt
end


  # while line.scan(/(\(\d[\s+*\d]+[^()]\d\)/) != []
  #   puts line.match(/\([\s+*\d]+[^()]\)/)
  #   m = line.match(/(\([\s+*\d]+[^()]\))/).captures[0]
  #   puts "match: #{m}
