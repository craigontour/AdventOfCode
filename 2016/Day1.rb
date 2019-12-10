require 'pp'

# Part 1
# input = ["R2, L3"]
# input = ["R2, R2, R2"]
# input = ["R5, L5, R5, R3"]

# Part 2
# data = ["R8", "R4", "R4", "R8"]

input = File.readlines('Day1_input.txt')
data = input[0].split(',')

x = y = 0
directions = [
  { "R" => [1,0], "L" => [-1,0] },
  { "R" => [0,1], "L" => [0,-1] },
  { "R" => [-1,0], "L" => [1,0] },
  { "R" => [0,-1], "L" => [0,1] }
]
dir = 0
visited = []

for i in 0...data.length
    l, m = data[i].strip[0], data[i].strip[1..-1].to_i

    xx = directions[dir][l][0]
    yy = directions[dir][l][1]
    # puts "#{x}, #{y} => #{l} #{m} | #{xx}, #{yy} in direction #{dir}"

    (1..m).each do |j|
      new_x = x + (j*xx)
      new_y = y + (j*yy)
      if visited.include?([new_x,new_y])
        p "Part 2: x = #{new_x}, y = #{new_y} => #{(new_x.abs+new_y.abs)}"
        exit
      else
        visited << [new_x, new_y]
      end
    end

    x = visited.last[0] #x + (m * xx)
    y = visited.last[1] #y + (m * yy)

    # r = gets.chomp
    # exit if r == 'x'

    if l.casecmp("L").zero?
      case dir
      when 0
        dir = 3
      when 1
        dir = 0
      when 2
        dir = 1
      when 3
        dir = 2
      end
    elsif l.casecmp("R").zero?
      case dir
      when 0
        dir = 1
      when 1
        dir = 2
      when 2
        dir = 3
      when 3
        dir = 0
      end
    else
        puts "Error: l is wrong #{l}"
        exit
    end
end

p "Part 1: x = #{x}, y = #{y} => #{(x.abs+y.abs)}"
