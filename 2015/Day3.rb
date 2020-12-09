# keywords: grid, hash of array to int, hash/array merge

require 'pp'

puts 'Day 3', '+++++++++++++++++++++++++'
input = File.readlines('Day3_input.txt').to_s

# PART 1

# For test input as
# input = '^>v<'
# wanted a 2D grid to output
# [
    # [0,0] = 2, [0,1] = 1
    # [1,0] = 1, [1,1] =11
#]
# Couldn't work it out. 

# Other's solutions used hash of array => int
grid = { [0, 0] => 1 }
x = 0
y = 0
p grid

for i in 0...input.length 

    if input[i] == '>'
        x += 1
    
    elsif input[i] == '<'
        x -= 1

    elsif input[i] == '^'
        y += 1

    elsif input[i] == 'v'
        y -= 1

    end

    # Only one occurrence of [x, y] adds will exist in hash
    # so it wont count number in each grid location
    grid[[x,y]] = 1
end
pp grid.length

# PART 2

# For test input as
# input = '^v^v^v^v^v' #'^>v<'

santa = {[0,0] => 1}
robo = {[0,0] => 1}
sx = 0
sy = 0
rx = 0
ry = 0

#
# sx and sy / rx and ry are all wrong
#

for i in 0...input.length 
    a = 0
    b = 0

    if input[i] == '>'
        a += 1
    elsif input[i] == '<'
        a -= 1
    elsif input[i] == '^'
        b += 1
    elsif input[i] == 'v'
        b -= 1
    end

    if i % 2 == 0
        # puts "Santa #{i}"
        sx += a
        sy += b
        santa[[sx,sy]] = 1
        # pp santa
    else
        # puts "Robo #{i}"
        rx += a
        ry += b
        robo[[rx,ry]] = 1
        # pp robo
    end

end

both = santa.merge(robo)
pp both.length
