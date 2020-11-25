# Day 7 2015
require 'pp'

# Series of instructions:-
#   123 -> x            signal 123 to wire x
#   x AND y -> z        z = (x & y).to_s(2)         BITWISE AND of x and y to wire z
#   x OR y -> z         z = (x ^ y).to_s(2)         BITWISE OR of x and y to wire z
#   p LSHIFT 2 -> q     q = (p << 2).to_s(2)        wire p value is LEFT-SHIFTED by 2 and to wire q
#   NOT e -> f          f = (~e).to_s(2)            BITWISE COMPLEMENT of value of wire e to wire f
#   RSHIFT              q = (p >> 2).to_s(2)        RIGHT-SHIFT by 2
#   To convert back to int, use .to_i(2)

# data = File.readlines("Day7_input.txt")
data = File.readlines("Day7_test.txt")

# Convert each line into readable operation
trans = {
  'AND'    => '&',
  'OR'     => '|',
  'NOT'    => '~',
  'LSHIFT' => '<<',
  'RSHIFT' => '>>'
}

ops = []
stack = {}

data.each do |l|
  left = ""

  op = l.gsub(Regexp.union(trans.keys), trans).       # Lookup Regexp.union
       gsub(/(.+?) -> (\w+)/) { "%2s = #$1" % $2 }.        # Lookup how this works
       upcase.                   # Mske upper case
       split("\n")[0]            # Remove LFCR

  i = op.split('=')[0].strip    # Left side
  j = op.split('=')[1].strip    # Right side

  if j.split(' ').length == 1 && j.split(' ')[0].match('\d+')
    puts "Left #{i} = #{j}"
    stack[i] ||= []
    stack[i] << j
  else
    ops.push(op)
  end
end
pp ops.sort
pp '--------'
puts stack.sort
exit

for i in 0...ops.length
  # puts ops[i]
    # ops[i].delete

    # assignee = ops[i].split('=')[0].split(' ')[0]
    # op = ops[i].split('=')[1].split(' ')
    # r = 0
    # x = 0
    # y = 0

    # puts "#{op} -> #{assignee} = #{op.length}"

    # if op.length == 1
    # # or when lalala then tumedee which returns tumdee so can assign to a var
    #     puts "#{assignee} => #{op[0]}"
    #     gates[assignee] = op[0].to_i

    # elsif op.length == 2
    #     x = gates[op[1].strip]
    #     r = 65535 - ((((~x).to_s(2)).to_i(2).abs)+1)
    #     puts "#{assignee} => #{op[0].strip} #{x} = #{r}"
    #     gates[assignee] = r

    # elsif op.length == 3
    #     x = gates[op[0].strip]

    #     case op[1].strip
    #     when "AND" then
    #         y = gates[op[2].strip]
    #         r = ((x & y).to_s(2)).to_i(2)
    #     when "OR" then
    #         y = gates[op[2].strip]
    #         r = ((x | y).to_s(2)).to_i(2)
    #     when "LSHIFT" then
    #         y = op[2].strip.to_i
    #         r = ((x << y).to_s(2)).to_i(2)
    #     when "RSHIFT" then
    #         y = op[2].strip.to_i
    #         r = ((x >> y).to_s(2)).to_i(2)
    #     else
    #         puts "Invalid operator #{op[1].strip}"
    #     end
    #     puts "#{assignee} => #{x} #{op[1]} #{y} => #{r}"
    #     gates[assignee] = r

    # else
    #     puts "Invalid operation."
    #     break
    # end
end
