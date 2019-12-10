require 'pp'

input = File.read('Day9_input.txt')
# input = 'X(8x2)(3x3)ABCY' #'(6x1)(1x3)A' #'(3x3)XYZ' #'A(1x5)BC'#

# Part 1

def process(str)
    # pp "str = #{str}"
    newstr = ''
    if str.chars.shift == '('
        items = /([A-Z]*)\(([0-9]*x[0-9]*)\)(.*)/.match(str)[1, 3] #/([0-9][A-Z]*)(\([0-9]*x[0-9]*\))(.*)/
        if items[0] == ''
            marker, qty = items[1].split('x')
            newstr += (items[2][0..(marker.to_i-1)] * qty.to_i)
        else
            newstr += items[0]
            marker, qty = items[1].split('x')
            newstr += (items[2][0..(marker.to_i-1)] * qty.to_i)
        end

        newstr += process(items[2][marker.to_i..items[2].length])
    else
        newstr += str
    end
    return newstr
end
pp process(input).length

# Part2
line = input.chomp.chars
def countLen(strArr)
    # pp "String length = #{strArr.length}"
    count = 0
    while strArr.length > 0 do
        nextStr = ''
        if strArr.shift == '('
          marker, qty = strArr.shift(strArr.index(')')+1).join.split('x').map(&:to_i)
          nextStr = strArr.shift(marker).join
          # pp marker
          # pp qty
          # pp nextStr
          if nextStr.include?('(')
            count += countLen(nextStr.chars) * qty
          else
            count += marker * qty
          end
        else
            count += 1
        end
    end
    return count
end

pp countLen(line)
