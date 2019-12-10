# Day 17
# TAGS: md5, grid
require 'digest'

##### CLASSES ######
class Node
  attr_accessor :coord, :steps, :hash, :parent

  def initialize (coord, steps, hash, parent)
      @coord = coord
      @steps = steps
      @hash = hash
      @parent = parent
  end

  # def to_s
  #     puts "coord: #{@coord} | steps: #{@steps} | hash: #{@hash}"
  # end
end

GRID = [
  ['#', '#', '#', '#', '#', '#', '#', '#', '#' ],
  ['#', 'S', '|', ' ', '|', ' ', '|', ' ', '#' ],
  ['#', '-', '#', '-', '#', '-', '#', '-', '#' ],
  ['#', ' ', '|', ' ', '|', ' ', '|', ' ', '#' ],
  ['#', '-', '#', '-', '#', '-', '#', '-', '#' ],
  ['#', ' ', '|', ' ', '|', ' ', '|', ' ', '#' ],
  ['#', '-', '#', '-', '#', '-', '#', '-', '#' ],
  ['#', ' ', '|', ' ', '|', ' ', '|', ' ', ' ' ],
  ['#', '#', '#', '#', '#', '#', '#', ' ', 'V' ]
]
OPEN = ['B', 'C', 'D', 'E', 'F']
START = [1,1]
TARGET = [7,7]
HASH = 'pgflpeqp'

q = []
paths = []

s = Node.new(START, 0, HASH, [])
q << s

def get_moves(this_node)
  moves = []
  x = this_node.coord[0]
  y = this_node.coord[1]

  # Move in [Y, X]: Up, Down, Left, Right
  # dirs = [ [-1, 0], [1, 0], [0, -1], [0, 1] ]
  dirs = { 'U' => [-1, 0], 'D' => [1, 0], 'L' => [0, -1], 'R' => [0, 1] }

  doors = Digest::MD5.hexdigest(this_node.hash)[0..3].upcase

  if OPEN.include?(doors[0]) && GRID[y-1][x] != '#'
    moves << Node.new([x, y-2], this_node.steps+1, this_node.hash + 'U', this_node.coord)
  end
  if OPEN.include?(doors[1]) && GRID[y+1][x] != '#' && y+2 < 9
    moves << Node.new([x, y+2], this_node.steps+1, this_node.hash + 'D', this_node.coord)
  end
  if OPEN.include?(doors[2]) && GRID[y][x-1] != '#'
    moves << Node.new([x-2, y], this_node.steps+1, this_node.hash + 'L', this_node.coord)
  end
  if OPEN.include?(doors[3]) && GRID[y][x+1] != '#' && x+2 < 9
    moves << Node.new([x+2, y], this_node.steps+1, this_node.hash + 'R', this_node.coord)
  end
  return moves
end

while !q.empty? do
  n = q.shift

  if n.coord == TARGET
    puts n.hash[8..(n.hash.length-1)]
    exit

    # r = gets.chomp
    # exit if r == 'x'
  end

  get_moves(n).each do |n|
    q << n
  end

end

