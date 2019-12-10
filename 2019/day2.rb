# Day 2
require 'pp'

# Part 1
input = File.readlines('Day2_input.txt')
data = input[0].split(',').each.map(&:to_i)

def theProgram (data, n, v)
  data[1] = n
  data[2] = v
  i = 0
  until data[i] == 99 do
    case data[i]
    when 1
      data[data[i+3]] = data[data[i+1]] + data[data[i+2]]
      i += 4
    when 2
      data[data[i+3]] = data[data[i+1]] * data[data[i+2]]
      i += 4
    when 99
      exit
    end
  end
  return data[0]
end

# Part 1
pp theProgram(data, 12, 2)


# Part 2

# PSEDUO...
# loop through n = 0 to 99
#              v = 0 to 99
#   replace data[1] = n
#           data[2] = v
#   run the program
#   stop if data[0] == 196...

for n in 0...99 do
  pp n
  for v in 0...99 do
    data = input[0].split(',').each.map(&:to_i)
    if theProgram(data, n, v) == 19690720
      puts "Part 2 = #{100 * n + v}"
      exit
    end
  end
end
