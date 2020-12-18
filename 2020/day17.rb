# keywords: 2d, 3d matrix

@debug = true

# Debugging
def prompt
  r = readline()
  exit() if r == "x\n"
end

def copyPlane(arr)
  newArr = Array.new(arr.length) { Array.new(arr[0].length, 0) }

  for j in 0..(arr.length-1) do
    for i in 0..(arr[0].length-1) do
      newArr[j][i] = arr[j][i]
    end
  end
  return newArr
end

# Prints a 2D plane in easy readable form
def printPlane(plane)
  hd = ''
  ((@minX-1)..(@maxX+1)).each { |h| hd += h.to_s }
  puts "   #{hd}"
  for y in ((@minY-1)..(@maxY+1)) do
    s = "#{y}: "
    for x in ((@minX-1)..(@maxX+1)) do
      s += plane[y][x].to_s
    end
    puts s
  end
  puts ''

end

def newPlane(h, w)
  return Array.new(h) { Array.new(w, 0)}
end

def newRow(w)
  return Array.new(w, 0)
end

def updatePoint(z, y, x)
  # count y, z in z-1 plane
  # count y, z in z plane
  # count y, z in z+1 plane
end

def updatePlane(z, plane)
  # z is index in grid of planes
  printPlane(plane) if @debug

  # need to go through each row (y) and update the points (x, y, z)
  for y in (@minY-1..@maxY+1) do
    # row = newRow((@maxX-@minX+3).abs) if y < @minY || y > @maxY
    for x in (@minX-1..@maxX+1) do
      puts "Update z:#{z}, y:#{y}, x:#{x} = #{@grid[z][y][x]}"
      plane[y][x] = updatePoint(z, y, x)
    end 
  end
  
  printPlane(plane) if @debug
  
  exit()
  
  # return a plane
  return plane
end
  
=begin
  # if plane doesn't exist and at least one point is active
  # then need add plane to grid
  puts "updated has #{updated.flatten.count(1)} active points"
  if z < @minZ
    puts "insert plane at front"
    @grid.insert(0, plane)
  elsif z > @maxZ
    puts "push plane to back"
    @grid.push(plane)
  end
=end

#  __  __       _       
# |  \/  | __ _(_)_ __  
# | |\/| |/ _` | | '_ \ 
# | |  | | (_| | | | | |
# |_|  |_|\__,_|_|_| |_|

@grid = []
plane = [
  [ 0, 1, 0 ],
  [ 0, 0, 1 ],
  [ 1, 1, 1 ]
]
@grid.insert(0, plane)
@minZ = 0
@maxZ = 0
@minY = 0
@maxY = 2
@minX = 0
@maxX = 2

2.times do |cycle|
  puts "Cycle: #{cycle+1}
  minZ:#{@minZ}, maxZ:#{@maxZ}, z length: #{@grid.length}
  minY:#{@minY}, maxY:#{@maxY}, y length: #{@grid[0].length}
  minX:#{@minX}, maxX:#{@maxX}, x length: #{@grid[0][0].length}" 

  # for each z plane...and those neighbouring
  for z in (@minZ-1)..(@maxZ+1) do
    puts "z: #{z}"
    # from this:
    #   [               ]
    #   [  , 0, 1, 0,   ]
    #   [  , 0, 0, 1,   ]
    #   [  , 1, 1, 1,   ]
    #   [               ]
    # to z=-1:
    #   [ 0, 0, 0, 0, 0 ]
    #   [ 0, 0, 0, 0, 0 ]
    #   [ 0, 1, 0, 0, 0 ]
    #   [ 0, 0, 0, 1, 0 ]
    #   [ 0, 0, 1, 0, 0 ]
    # to z=0:
    #   [ 0, 0, 0, 0, 0 ]
    #   [ 0, 0, 0, 0, 0 ]
    #   [ 0, 1, 0, 1, 0 ]
    #   [ 0, 0, 1, 1, 0 ]
    #   [ 0, 0, 1, 0, 0 ]
    # to z=1:
    #   [ 0, 0, 0, 0, 0 ]
    #   [ 0, 0, 0, 0, 0 ]
    #   [ 0, 1, 0, 0, 0 ]
    #   [ 0, 0, 0, 1, 0 ]
    #   [ 0, 0, 1, 0, 0 ]

    h = (@minY-1..@maxY+1).each.reduce(:+)
    w = (@minX-1..@maxX+1).each.reduce(:+)

    if z < @minZ
      @grid.insert(z, newPlane(h, w))
    elsif z > @maxZ
      @grid.push(newPlane(h, w))
    end
    plane = @grid[z]
    printPlane(plane) if @debug

    puts "plane h:#{plane.length}, w:#{plane[0].length}" if @debug
    updatePlane(z, plane)

    prompt
  end

  @minZ -= 1
  @maxZ += 1
  @minY -= 1
  @maxY += 1
  @minX -= 1
  @maxX += 1   
end

exit()

@grid.each_with_index do |p, i|
  puts "Z index: #{i}"
  printPlane(p)
end