# Day 7
require 'pp'

# Part 1

# borrowed the defs from https://www.reddit.com/r/adventofcode/comments/5gy1f2/2016_day_7_solutions/ (search for 'stateless')
def group(addr)
  addr.split(/\[|\]/).
    zip([0, 1].cycle).              # string has to alternate as *[*]*[*]* so it orders the l, r and [] parts
    sort_by{|a, i| i}.              # puts the [] at the end
    chunk{|a, i| i}.to_a.           # chunks https://apidock.com/ruby/Enumerable/chunk
    map{|ck, ary| ary.map{|str, num| str} } # removes the ints from chunk array and returns array with strings
end

def get_abba(str)
  str.chars.each_cons(4).map{|a, b, c, d| (a == d && b == c && a != b) ? [a,b,c,d].join : nil}.compact
  # str.chars.each_cons(x) get x number of chars in a string and does what I was trying to do in regex below
end

def checkgroups(groups)
  out, hyp = groups.map{|g| g.map{|el| get_abba(el)}.flatten}
  #   out, hyp = groups.map { |g| g }
  if hyp == [] && out != []
    # pp out
    return true
  end
  false
end

inp = File.readlines('Day7_input.txt').map{|s| s.strip}
pp inp.map{ |addr|
   checkgroups(group(addr))
}.count(true)  # answer is 110

# Part 2

def get_aba(str)
  str.chars.each_cons(3).map{|a, b, c| (a == c && a != b) ? [a,b,c].join : nil}.compact
end

def checkgroups2(groups)
  out, hyp = groups.map{|g| g.map{|el| get_aba(el)}.flatten}
  #   out, hyp = groups.map { |g| g }
  out.each do |o|
    a, b, c = o.chars
    hyp.each do |h|
      return true if h.include?(b + a + b)
    end
  end
  false
end

inp2 = File.readlines('Day7_input.txt').map{|s| s.strip}
pp inp2.map{ |addr2|
   checkgroups2(group(addr2))
}.count(true)  # answer is ?

exit

# does  N O T  work......
x = 0
File.read('Day7_test.txt').each_line { |line|
line = line.chomp
# pp line
  skipTrue = false
  for a in 'a'..'z'
    next if skipTrue
    for b in 'a'..'z'
      next if a == b || skipTrue
        find = a + b + b + a
        if line =~ /.*(\[.*#{find}.*\]).*/
          pp "Find = #{find}"
          skipTrue = true
          pp "Mid = #{line}"
        else
          if line =~ /.*#{find}.*/ #|| line =~ /.*\].*#{find}.*/
            x += 1
            skipTrue = true
            pp "Else = #{line}"
          # else
          #   pp "Waah = #{line}"
          end
        end
    end
  end
}
pp x  # answer is wrong with 83 !
