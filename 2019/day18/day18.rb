# Find shortest path through a maze while collecting keys and opening doors

class Coord

  attr_accessor :coord, :x, :y

  def initialize(y, x)
    @coord = [x, y]
  end
  def x
    @coord[0]
  end
  def y
    @coord[1]
  end
  def to_s
    puts "Coord: #{coord[1]}, #{coord[0]}"
  end

end

class Vault

  attr_accessor :grid, :start

  def initialize (grid, start)
    @grid = grid
    @start = start
  end

  def key  # lowercase letter
  end

  def door  # uppercase letter
  end

  def valid_moves(coord)
    moves = []
    # given a position x, y return array of possible x,y locations to move
    # need to check it doesnt go out of bounds
    [[0,1],[1,0],[-1,0],[0,-1]].each do |m|
      chr = @grid[coord.y + m[0]][coord.x + m[1]]
      if chr != '#' && chr != "@"
        puts "#{m[0]}, #{m[1]} = #{chr}"
        moves << Coord.new(coord.x+m[1], coord.y+m[0])
      end
    end
    return moves
  end

  def to_s
    start.to_s
    for x in 0...(grid.length)
      s = ""
      for y in 0...(grid[0].length)
        s += grid[x][y]
      end
      puts s
    end
  end

end

########################
#f.D.E.e.C.b.A.@.a.B.c.#
######################.#
#d.....................#
########################

# find valid paths, add to stack, do same, until no paths
#########
#b.A.@.a#
#########

input = File.readlines('day18_test.txt')
h = input.length
w = input[0].length
grid = Array.new(h) { Array.new(w, 0) }
start = []

# puts "Grid is #{w} wide and #{h} high"
# puts "Grid looks like #{grid}"

input.each_with_index do |row, i|
  grid[i] = row.chomp.chars
  if row.include?("@")
    start = Coord.new(i,row.index("@"))
  end
end

vault = Vault.new(grid, start)
vault.valid_moves(start).each { |c| 
  pp c
  
}
