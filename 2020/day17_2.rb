# keywords: 2d, 3d matrix

@debug = true

# Debugging
def prompt
  r = readline()
  exit() if r == "x\n"
end

def createPlane(h, w)
  return Array.new(h) { Array.new(w, 0)}
end

def copyPlane(plane)
  newPlane = createPlane(plane.length, plane[0].length)

  for j in 0..(plane.length-1) do
    for i in 0..(plane[0].length-1) do
      newPlane[j][i] = plane[j][i]
    end
  end
  return newPlane
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

def updatePoint(z, y, x)
  # count y, z in z-1 plane
  # count y, z in z plane
  # count y, z in z+1 plane
end

def updatePlane(plane, z)
  # z is index in grid of planes
  printPlane(plane) if @debug

  # # need to go through each row (y) and update the points (x, y, z)
  # for y in (@minY-1..@maxY+1) do
  #   # row = newRow((@maxX-@minX+3).abs) if y < @minY || y > @maxY
  #   for x in (@minX-1..@maxX+1) do
  #     puts "Update z:#{z}, y:#{y}, x:#{x} = #{@grid[z][y][x]}"
  #     plane[y][x] = updatePoint(z, y, x)
  #   end 
  # end
  
  # printPlane(plane) if @debug
  
  exit()
  
  # return a plane
  return plane
end

#  __  __       _       
# |  \/  | __ _(_)_ __  
# | |\/| |/ _` | | '_ \ 
# | |  | | (_| | | | | |
# |_|  |_|\__,_|_|_| |_|

@planes = [
  [
    [ 0, 1, 0 ],
    [ 0, 0, 1 ],
    [ 1, 1, 1 ]
  ]
]

2.times do |cycle|
  puts "Cycle: #{cycle+1}"

  @d = @planes.length
  @h = @planes[0].length
  @w = @planes[0][0].length

  # for each plane
  @planes.each_with_index do |plane, z|

    updatePlane(plane, z)

    prompt
  end
end

exit()
