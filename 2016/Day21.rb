# Day 21

DEBUG = false
input = File.readlines('Day21_input.txt')
# input = File.readlines('Day21_test.txt')

def swap_pos(s, x, y)
  temp1, temp2 = s[x], s[y]
  p "in #{s} swap_pos #{temp1} and #{temp2}" if DEBUG
  s[x], s[y] = temp2, temp1
  return s
end
def swap_letter(s, a, b)
  p "in #{s} swap_letter #{a} and #{b}" if DEBUG
  return s.gsub(a,'!').gsub(b,'@').gsub('!',b).gsub('@',a)
end
def reverse(s, x, y)
  p "in #{s} reverse from #{x} to #{y}" if DEBUG
  if x > 0 && y < s.length-1
    s = s[0...x] + s[x..y].reverse + s[y+1..s.length]
  elsif x > 0
    s = s[0...x] + s[x..y].reverse
  elsif y < s.length-1
    s = s[0..y].reverse + s[y+1..s.length]
  else
    s.reverse!
  end
  return s
end
def rotateleft(s, n)
  p "in #{s} rotate left by #{n}" if DEBUG
  n.times do 
    s = s[1..s.length-1] + s[0]
  end
  return s
end
def rotateright(s, n)
  p "in #{s} rotate right by #{n}" if DEBUG
  n.times do
    s = s[-1] + s[0...s.length-1]
  end
  return s
end
def move(s, x, y)
  p "in #{s} move #{x} to #{y}" if DEBUG
  temp = s.slice!(x)
  s = s.insert(y, temp)
  return s
end

# def rotatebased(s, a)
#   i = (s.index(a) > 3 ? s.index(a) + 2 :  s.index(a) + 1) % s.length
#   p "in #{s} rotate based on #{a} by #{i}" #if DEBUG
#   return rotateright(s, i)
# end
# s= 'abcdefgh'
# for i in (0...s.length) do
#   p rotatebased( s, s[i])
# end
# exit

def solve(input, s, part1)
  input.each do |line|
    line.chomp!

    if line =~ /rotate right/
      res = line.match(/^.* (\d) .*$/) { |m| m[1] }
      if part1
        s = rotateright(s,res.to_i)
      else
        s= rotateleft(s,res.to_i)
      end

    elsif line =~ /rotate left/
      res = line.match(/^.* (\d) .*$/) { |m| m[1] }
      if part1
          s= rotateleft(s,res.to_i)
      else
        s = rotateright(s,res.to_i)
      end

    elsif line =~ /rotate based/
      # s = rotatebased(s, line[-1])
      a = line[-1]
      p "in '#{s}' rotate based on #{a}"# if DEBUG

      i = (s.index(a) > 3 ? s.index(a) + 2 :  s.index(a) + 1) % s.length
      puts "rotate based s.index(a) = #{s.index(a)} | i = #{i}"
      if part1
        s = rotateright(s, i)
      else
        if i < s.length
          s = rotateleft(s, s.length - i)
        else
          s = rotateleft(s, i % s.length)
        end
      end

    elsif line =~ /reverse/
      rev = line.match(/^.* (\d) .* (\d)$/) { |m| m[1,2] }
      s = reverse(s,rev[0].to_i,rev[1].to_i)

    elsif line =~ /position/
      res = line.match(/^.* (\d) .* (\d)$/) { |m| m[1,2] }
      if line =~ /move/
        if part1
          s = move(s,res[0].to_i,res[1].to_i)
        else
          s = move(s,res[1].to_i,res[0].to_i)
        end
      else
        s = swap_pos(s, res[0].to_i, res[1].to_i)
      end

    elsif line =~ /swap letter/
      res = line.match(/^.* ([a-z]) .* ([a-z])$/) { |m| m[1,2] }
      s = swap_letter(s,res[0],res[1])

    else
      puts "Missed input #{line}"
    end
    puts "#{line} => #{s}"
  end

  return s
end

# puts "Test 1 = #{solve(input, 'abcde', true)}"
# puts "Test 2 = #{solve(input.reverse, 'decab', false)}"
# exit


puts "Part 1 = #{solve(input, 'abcdefgh', true)}"
puts "Part 2 = #{solve(input.reverse, 'fbgdceah', false)}"
