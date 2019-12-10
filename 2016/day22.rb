# Day 22

if true
  input = File.readlines('./Day22_test.txt')
  grid = Array.new(3) { Array.new(3, '.') }
  grid[0][0] = '@'
  grid[0][2] = 'G'
else
  input = File.readlines('./Day22_input.txt')
  grid = Array.new(27) { Array.new(35, '.') }
  grid[0][0] = '@'
  grid[0][34] = 'G'
end

class Node
  attr_accessor :x, :y, :size, :used, :free
  def initialize (x, y, size, used, free)
    @x = x
    @y = y
    @size = size
    @used = used
    @free = free
  end
  def !=(other)
    self.x != other.x && self.y != other.y
  end
end
def pause
  r = gets.chomp
  exit if r == 'x'
end

nodes = []
input.each do |line|
  x, y, size, used, free = line.match(/^.*x(\d+)-y(\d+)\s*(\d+)T\s*(\d+)T\s*(\d+)T\s*(\d+)%$/) { |m| m[1..5] }
  node = Node.new(x.to_i, y.to_i, size.to_i, used.to_i, free.to_i)
  nodes << node
end

n = 0
nodes.each do |nodeA|
  next if nodeA.used == 0

  nodes.each do |nodeB|
    if nodeA.used <= nodeB.free
      # puts "#{n} : nodeA #{nodeA.used} <= #{nodeB.free}"
      n += 1
    end
  end
end

# Part 1
p "Part 1 = #{n}"

# Part 2

# grid(35, 27)
def printGrid(array)
  for y in 0...array.length
    s = ''
    for x in 0...array[0].length
      s = s + array[y][x].to_s
    end
    puts s
  end
end
printGrid(grid)

