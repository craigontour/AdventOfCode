# keywords: zip: 
require 'pp'

# PART 2 cheat

def group(addr)
  addr.split(/\[|\]/).
    zip([0, 1].cycle).              # string has to alternate as *[*]*[*]* so it orders the l, r and [] parts
    sort_by{|a, i| i}.              # puts the [] at the end
    chunk{|a, i| i}.to_a.           # chunks https://apidock.com/ruby/Enumerable/chunk
    map{|ck, ary| ary.map{|str, num| str} } # removes the ints from chunk array and returns array with strings
end

def getabas(str)
    str.chars.each_cons(3).map{|a, b, c| (a == c && a != b) ? [a,b,c].join : nil}.compact
end

def checkgroups2(groups)
  out, hyp = groups.map{|g| g.map{|el| getabas(el)}.flatten}
  out.each do |o|
    a, b, c = o.chars
    return true if hyp.include?(b + a + b)
  end
  false
end

inp = File.readlines('Day7_input.txt').map{|s| s.strip}
inp.map{ |addr|
    checkgroups2(group(addr))
}.count(true)
