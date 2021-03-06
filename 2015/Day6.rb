# keywords: 2d array, grid

require 'pp'
data = File.readlines('Day6_input.txt')
# data = File.readlines("Day6_test.txt")

# Ref for 1000 x 1000 array of 0's
# See https://www.thoughtco.com/two-dimensional-arrays-in-ruby-2907737

def switch1(rect, grid, mode)
  (rect[0]..rect[2]).each do |x|
    (rect[1]..rect[3]).each do |y|
      n = mode < 0 ? (grid[y][x] + mode).abs : mode
      grid[y][x] = n
    end
  end
end

def part1(data)
  size = 1000
  lights = Array.new(size) { Array.new(size, 0) }
  c = 0

  data.each do |line|
    # puts line
    rect = []
    s = 0
    a = line.split('through')[0].split(',')[0].split(' ')
    if a.length == 2
      rect[0] = a[1].strip.to_i
      s = -1
    else
      rect[0] = a[2].strip.to_i
      s = if a[1].include?('on')
            1
          else
            0
          end
    end
    rect[1] = line.split('through')[0].split(',')[1].strip.to_i
    rect[2] = line.split('through')[1].split(',')[0].strip.to_i
    rect[3] = line.split('through')[1].split(',')[1].strip.to_i

    switch1(rect, lights, s)
  end

  lights.each do |a|
    c += (a.count 0)
  end
  puts "Part 1 answer: #{1000000 - c}"
end
part1(data)

#
# PART 2
#
def switch2(rect, grid, s)
  (rect[0]..rect[2]).each do |x|
    (rect[1]..rect[3]).each do |y|
      grid[y][x] = grid[y][x] + s
      if grid[y][x] < 0
        grid[y][x] = 0
      end
    end
  end
end

def count2(grid)
  total = 0
  (0..999).each do |x|
    (0..999).each do |y|
      total += grid[y][x]
    end
  end
  total
end

def part2(data)
  size = 1000
  lights = Array.new(size) { Array.new(size, 0) }
  c = 0

  data.each do |line|
    rect = []
    s = 0
    a = line.split('through')[0].split(',')[0].split(' ')
    if a.length == 2
      rect[0] = a[1].strip.to_i
      s = 2
    else
      rect[0] = a[2].strip.to_i
      s = if a[1].include?('on')
            1
          else
            -1
          end
    end
    rect[1] = line.split('through')[0].split(',')[1].strip.to_i
    rect[2] = line.split('through')[1].split(',')[0].strip.to_i
    rect[3] = line.split('through')[1].split(',')[1].strip.to_i

    switch2(rect, lights, s)
  end

  b = 0
  lights.flatten.each { |el| b += el }
  puts "Part 2 answer: #{b}"
end
part2(data)
