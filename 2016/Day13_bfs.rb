# Breadth First Search
require 'thread'

class Node
    attr_accessor :coord, :steps, :parent

    def initialize (coord, steps, parent)
        @coord = coord
        @steps = steps
        @parent = parent
    end

    def to_s
        puts "This Path at #{@coord} has gone #{@steps} and parent is #{@parent}"
    end
end

$debug = false
$fav = 1350
$offsets = [[-1,0],[0,-1],[1,0],[0,1]]
$visited = []

##### THE GRID #####
$dx = 50
$dy = 50
grid = Array.new($dy+1) { Array.new($dx+1, ' ') }

##### FUNCTIONS #####
def getLoc(x, y)
    a = x*x + 3*x + 2*x*y + y + y*y
    if (a + $fav).to_s(2).count('1') % 2 == 0
        return '.'
    else
        return '#'
    end
end
def createGrid(grid)
    for y in 0..$dy
        for x in 0..$dx
            grid[y][x] = getLoc(x, y)
        end
    end
    return grid
end
def printGrid(grid)
    # puts '   0123456789'
    puts '   01234567890123456789012345678901234567890123456789'
    for y in 0...grid.length
        if y < 10
            s = '  '
        else
            s = ' '
        end
        for x in 0...grid[0].length
            s = s + grid[y][x]
        end
        puts y.to_s + s
    end
end
def getChildren(pt, grid)
    x = pt[0]
    y = pt[1]
    puts "  getFree for #{x}, #{y}" if $debug
    locs = []
    for i in 0..3
        nx = x + $offsets[i][0]
        ny = y + $offsets[i][1]
        if nx > -1 && ny > -1 && nx < $dx+1 && ny < $dy+1
            if grid[ny][nx] == '.' && !$visited.include?([nx, ny])
                locs << [nx, ny]
                puts "   point free = #{nx}, #{ny}" if $debug
            end
        end
    end
    return locs
end
def breadth_first_search(grid, start, target, maxSteps)
    $visited = []
    $visited << start

    # Create class of node with accessors for coord, steps, parent
    node = Node.new(start, 0, [])
    q = [] #Queue.new
    q << node

    while q.length > 0 do
        curr_node = q.shift
        curr_node.to_s if $debug

        return curr_node.steps if curr_node.coord == target
        return 0 if (curr_node.steps > maxSteps && maxSteps > 0)

        children = getChildren(curr_node.coord, grid)
        puts " children.len = #{children.length}" if $debug

        children.each do |c|
            $visited << c
            q << Node.new(c, curr_node.steps+1, curr_node.coord)
        end
        puts " q.length = #{q.length} -> #{q}" if $debug

        # r = gets.chomp
        # if r == 'x' 
        #     exit
        # end
    end
    return 0
end

grid = createGrid(grid)
# printGrid(grid)

# Part 1 - shortest path from [1,1] to [31,39]
part1 = breadth_first_search(grid, [1,1], [31,39], 0)
puts "Part 1 answer: #{part1}"

exit

# Part 2 - how many vertices on path of less than 50 steps
part2 = 0
(0..$dy).each do |y|
    (0..$dx).each do |x|
        v = 0
        if grid[y][x] == '.'
            v = breadth_first_search(grid, [1,1], [x,y], 50)
            part2 += 1 if v > 0
            puts "#{part2}: [#{x},#{y}] is #{v}" if v > 0
        end
    end
end
puts "Part 2 answer: #{part2}"
