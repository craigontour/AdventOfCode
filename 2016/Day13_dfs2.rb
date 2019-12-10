# Depth first doesnt work because it keeps going
#  deeper and deeper and exists with undefined method
#  because of out of bounds of array

$debug = true
$fav = 10
$offsets = [[-1,0],[0,-1],[1,0],[0,1]]

def printGrid(array)
    puts '   0123456789'
    for y in 0...array.length
        if y < 10
            s = '  '
        else
            s = ' '
        end
        for x in 0...array[0].length
            s = s + array[y][x].to_s
        end
        puts y.to_s + s
    end
end

def getLoc(x, y)
    a = x*x + 3*x + 2*x*y + y + y*y
    if (a + $fav).to_s(2).count('1') % 2 == 0
        return '.'
    else
        return '#'
    end
end

def getFree(pt, grid)
    x = pt[0]
    y = pt[1]
    puts " getFree for #{x}, #{y}" if $debug
    locs = []
    if x > -1 && y > -1
        for i in 0..3
            nx = x + $offsets[i][0]
            ny = y + $offsets[i][1]
            if grid[ny][nx] == '.' #&& !$visited.include?([nx, ny])
                locs << [nx, ny]
                puts " point free = #{nx}, #{ny}" if $debug
            end
        end
    end
    return locs
end

def depth_first_search(grid, source_index, end_index)
    node_stack = [source_index]
    puts "1 #{node_stack}"

    loop do
        curr_node = node_stack.pop
        puts "2 #{curr_node}"
        return false if curr_node == nil
        puts "3 #{end_index}"
        return true if curr_node == end_index

        children = getFree(curr_node, grid)

        node_stack = node_stack + children
        puts node_stack.length

        r = gets.chomp
        if r == 'q' 
            exit
        end
    end
end

grid = [
    ['.','#','.','#','#','#','#','.','#','#'],
    ['.','.','#','.','.','#','.','.','.','#'],
    ['#','.','.','.','.','#','#','.','.','.'],
    ['#','#','#','.','#','.','#','#','#','.'],
    ['.','#','#','.','.','#','.','.','#','.'],
    ['.','.','#','#','.','.','.','.','#','.'],
    ['#','.','.','.','#','#','.','#','#','#']
]

printGrid(grid)

depth_first_search(grid, [1,1], [7,4])
