# A DEPTH FIRST SEARCH

require 'pp'

def getLoc(x, y)
    a = x*x + 3*x + 2*x*y + y + y*y
    if (a + 10).to_s(2).count('1') % 2 == 0
        return '.'
    else
        return '#'
    end
end

def getFree(n, visited)
    offsets = [[1,0],[0,1],[-1,0],[0,-1]]
    x = n[0]
    y = n[1]
    pp "Find free for #{x}, #{y}"
    locs = []
    for i in 0..3
        nx = x + offsets[i][0]
        ny = y + offsets[i][1]
        if nx > -1 && ny > -1
            if getLoc(nx, ny) == '.' && !visited.include?([nx, ny])
                    locs << [nx, ny]
            end
        end
    end
    return locs
end

def traverse(node, target, stack, visited)
    stack = [node]

    loop do
        curr = stack.pop
        $steps += 1

        pp "#{curr} == #{target} = #{curr == target}"
        return true if curr == target
        return false if curr == []

        visited << curr

        children = getFree(curr, visited)
        pp "children = #{children}"

        if children == []
            $steps -= 1
        else
            for c in children
                pp "push #{c}"
                stack << c
            end
        end
puts $steps
puts
        # pp stack
        # pp visited
        # gets
   end
   return steps
end

$steps = 0
res = traverse([1,1],[7,4], [], [])
pp res
pp $steps 