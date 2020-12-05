# keywords: 2d array, grid, coords

size = 6

lights = []

File.readlines("day18.tst").each do |line|
  lights << line.chomp
end

def printGrid(grid)
  grid.each do |l|
    pp l
  end
end

def neightbours(grid, x, y)
  s = []
  for yy in y-2..y+2
    for xx in x-2..x+2
      if (xx >= 0 and xx <= grid[0].length) and
         (yy >= 0 and yy <= grid[0].length)
        #  puts "#{xx},#{yy}: #{grid[yy][xx]}"
         s << grid[yy][xx]
      else
        # puts "#{xx},#{yy}: -"
      end
    end
  end
  s
end

def state(lights, coord)
  if neighbours(lights, 3, 3)
    pp s.count('#')
  end
end

for move in 0..4
  pp combination(size)
  # for y in 0..(size-1)
  #   for x in 0..(size-1)
  #     changeState(lights)
  #   end
  # end
end