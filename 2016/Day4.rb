require 'pp'

part1 = 0
File.read('Day4_input.txt').each_line { |line|
    # borrowed sort_by, map, take from this:-
    # m=line.chomp.split(/\W/)  # or this but i dont see how /[-\[\]]/
    # cs=m.pop
    # sid=m.pop.to_i
    # pp m.join.chars.group_by{|x|x}.sort_by{|k,v|[-v.size,k]}.map{|k,v|k}.take(5).join

    items = line.chomp.split(/\W/)
    # pp items[0..-3]
    sid = items[-2].to_i
    # pp sid
    right = items[-1]
    # pp right
    
    part1 += sid if items[0..-3].join.chars.sort.join.each_char.with_object({}) { |c, h|
        (h[c] = h.fetch(c,0) + 1) if c =~ /[a-z]/ }.sort_by {|k, v| [-v, k] }.map{|k,v|k}.take(5).join.include?(right)
}

pp part1
puts

# PART 2

part2 = 0

def caesar_cipher(string, sid)
  shiftyArray = []
  charLine = string.chars.map(&:ord)

  shift = sid % 26
  shiftyArray << charLine.map do |c|
    (c + shift < 123 ? (c + shift) : (c + shift) - 26).chr
  end.join
  return shiftyArray[0]
end

File.read('Day4_input.txt').each_line { |line|
    items = line.chomp.split(/\W/)
    sid = items[-2].to_i
    right = items[-1]
    ciph = caesar_cipher(line,sid)
    if ciph =~ /.*north.*/
        pp "Cipher #{ciph} has sid #{sid}"
    end
}
