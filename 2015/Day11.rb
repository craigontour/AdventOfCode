# Day 11
require 'pp'

input = 'cqjxjnds'

# Passwords must
# - include one increasing straight of at least three letters like abc, bcd, cde
# - may not contain the letters i, o, or l
# - contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
    # puts "#{i}: #{a[i]} = #{a[i].ord}"
    # puts "#{i}: #{a[i + 1]} = #{a[i + 1].ord}"
    # puts "#{i}: #{a[i + 2]} = #{a[i + 2].ord}"

def goodpassword(input)
  # puts "Checking password rules for: #{input}..."
  # readline()

  input.chars.each_with_index do |_, i|
    next if i > 5

    # Rule 1
    if input[i + 1].ord - input[i].ord == 1 && input[i + 2].ord - input[i + 1].ord == 1
      # pp 'Rule 1: pass'

      # Rule 2
      unless input =~ /[iol]/
        # pp 'Rule 2: pass'

        # Rule 3
        c = 0
        ('a'..'z').map { |l| l + l }.each do |p|
          if input.match(p)
            c += 1
            # puts "#{c}: #{input} contains #{p}"
          end
          return true if c > 1
        end
      end
    end
  end
  return false
end

def increment(s)
  if s[-1] == 'z'
    increment(s[0..(s.length - 2)]) + 'a'
  else
    s[0..(s.length - 2)] + (s[-1].ord + 1).chr
  end
end

def main(input)
  until goodpassword(input) do
    input = increment(input)
  end
  return input
end

part1 = main('cqjxjnds')
puts "Part 1: #{part1}"
part2 = main(increment(part1))
puts "Part 2: #{part2}"
