# Day 12
# TAGS: regex, case, File.read, while
require 'pp'

debug = false
if debug
    input = File.readlines('Day12_test.txt')
else
    input = File.readlines('Day12_input.txt')
end

#Part 1
reg = {'a' => 0,'b' => 0,'c' => 0 ,'d' => 0}
#Part 2
reg = {'a' => 0,'b' => 0,'c' => 1 ,'d' => 0}

i = 0

while i < input.length
    pp i if debug
    line = input[i].chomp
    pp line if debug

    case line
    when /cpy\s([a-z]+)\s([a-z])/
        pp "1. copy #{$1} to #{$2}" if debug
        reg[$2] = reg[$1]
        i += 1
    when /cpy\s([1-9]+)\s([a-z])/
        pp "2. copy #{$1} to #{$2}" if debug
        reg[$2] = $1.to_i
        i += 1
    when /inc\s([a-z])/
        pp "incr #{reg[$1]} by 1" if debug
        reg[$1] += 1
        i += 1
    when /dec\s([a-z])/
        pp "decr #{reg[$1]} by 1" if debug
        reg[$1] -= 1
        i += 1
    when /jnz\s([a-z])\s([-]?\d+)/
        pp "3. jnz #{$1} to #{$2}" if debug
        j = $2.to_i
        if reg[$1] > 0
            pp "jump #{j} => #{i+j}" if debug
            i = i + j
            pp "new x is #{i}" if debug
        else
            pp "reg #{$1} = #{reg[$1]}. No jump" if debug
            i += 1
        end
    when /jnz\s([1-9]+)\s(\d+)/
        if $1.to_i > 0
            pp "4. jnz #{$1} to #{$2}" if debug
            i = (i + $2.to_i)
            pp "new i is #{i}" if debug
        else
            pp "reg = #{$1}. No jump" if debug
            i += 1
        end
        i += 1
    end
end
puts reg
