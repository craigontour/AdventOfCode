# Day 17
# TAGS: md5
require 'digest'

##### CLASSES ######
class Node
  attr_accessor :steps, :hash, :coord

  def initialize (steps, hash, coord)
    @steps = steps
    @hash = hash
    @coord = coord
  end

  def to_s
      puts "steps: #{@steps} | path: #{@hash} | coord: #{@coord}"
  end
end

START = [0,0]
TARGET = [3,3]
HASH = 'pgflpeqp'
DIRECTIONS = {"U" => [0, -1], "D" => [0, 1], "L" => [-1, 0], "R" => [1, 0]}
PART1 = false

q = []
paths = []

n = Node.new(0, '', START)
q << n

def get_moves(this_node)
  moves = []
  x = this_node.coord[0]
  y = this_node.coord[1]

  doors_open = Digest::MD5.hexdigest(HASH + this_node.hash)
    .chars.take(4)
    .map { |c| c =~ /[b-f]/ }

  directions = DIRECTIONS.select.with_index { |_, i|  doors_open[i] }

  directions.each do |d, (i, j)|
    new_x, new_y = x + i, y + j
    next if new_x < 0 || new_x > 3 || new_y < 0 || new_y > 3

    moves << Node.new(this_node.steps+1, this_node.hash + d, [new_x, new_y])
  end

  # r = gets.chomp

  return moves
end

loop do
  n = q.shift
  break unless n

  if n.coord == TARGET
    if PART1
      puts n.hash
      exit
    else
      paths << n
    end

  else
    get_moves(n).each do |n|
        q << n
    end
  end

end

puts paths.first.hash
puts paths.last.steps
