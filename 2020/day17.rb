require 'Matrix'

# Debugging
def prompt
  r = readline()
  exit() if r == "x\n"
end

# Prints a 2D plane in easy readable form
def printPlane(plane)
  for y in 0..(plane.length-1) do
    s = ''
    for x in 0..(plane[0].length-1) do
      s += plane[y][x].to_s
    end
    puts s
  end
  puts ''
end

def updatePointsOnPlane(plane)
  free = 0
  puts "updatePoints:"
  printPlane(plane) #if @debug

  # vertices.each do |el|
  #   if el == 'L'
  #     break
  #   elsif el == '#'
  #     free = 1
  #     break
  #   end
  # end
  # return free
end

# initialise
@grid = []
state0 = [
  [ 0, 1, 0 ],
  [ 0, 0, 1 ],
  [ 1, 1, 1 ]
]
@grid.insert(0, state0)

@zz = @grid.length
@yy = @grid[0].length
@xx = @grid[0][0].length

puts "zz: #{@zz}, yy: #{@yy}, xx: #{@xx}"

for z in 0..(@grid.length-1) do
  puts "z: #{z}"

  # new plane in 3D space, x-1, y-1 to x+1, y+1
  plane = Array.new(@yy) { Array.new(@xx, 0) }
  for y in 0..(@grid[0].length) do
    updatePointsOnPlane(@grid[y])
  end
  # printPlane(plane)
end
