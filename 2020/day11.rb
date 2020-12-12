
def prompt
  r = readline()
  exit() if r == "x\n"
end

INPUT = []
File.open('day11.tst').readlines().each do |line|
  INPUT << line.chomp #.gsub("L","#")
end

H = INPUT.length
W = INPUT[0].length

# Parameters: input matrix (starting 0,0), top-left and bottom-right coordinates
#             defining the sub-matrix to check.
# Function  : Gets the value of each point within the sub-matrix lower and upper bounds
#             that are within bounds of 'matrix' (0,0)-(input.width, input.height) and
#             not in exclusion (a single coordinate).
# Returns   : a new matrix of values only within bounds.
def countInSubMatrix(matrix, topLeft, bottomRight, exclusion, debug)
  # count of #
  count = 0

  # for each row in matrix
  for y in topLeft[1]..bottomRight[1] do
    # skip if topLeft is out of Y bounds
    next if y < 0 || y > (matrix.length-1)

    # for each column in row
    for x in topLeft[0]..bottomRight[0] do

      # skip if topLeft is out of X bounds OR [x, y] is exclusion coord
      next if x < 0 || x > (matrix[0].length-1) || (x == exclusion[0] && y == exclusion[1])

      # Increment count if matrix coordinate value == ch
      if matrix[y][x] == '#'
        count += 1
      end
      # puts "x: #{x}, y: #{y}, seat: #{matrix[y][x]}, c: #{count}" if debug
    end
    prompt if debug
  end
  return count
end

def copyArray(arr)
  newArr = []
  arr.each_with_index { |el, i| newArr << arr[i] }
  return newArr
end

def countInWiderMatrix(matrix, topLeft, bottomRight, exclusion, debug)
  occupied = []
  count = 0

  f = 1
  for y in topLeft[1]..bottomRight[1] do
    for x in topLeft[0]..bottomRight[0] do
      break if occupied.length == 8

      next if (x == exclusion[0] && y == exclusion[1])

      # puts "x: #{x}, y: #{y}, seat: #{seats[y][x]}"
      puts "f: #{f}, f*y: #{f*y}, f*x: #{f*x}" if debug
      if y < 0
        if x < 0
          occupied << [-1,-1]
        elsif x > (matrix[0].length-1)
          occupied << [-1, 1]
        else
          occupied << [-1, 0]
        end
      elsif x < 0
        if y > (matrix.length-1)
          occupied << [1,-1]
        else
          occupied << [0, -1]
        end
      elsif y > (matrix.length-1)
        if x > (matrix[0].length-1)
          occupied << [1,1]
        else
          occupied << [1,0]
        end
      elsif x > (matrix[0].length-1)
        occupied << [0, 1]
      else
        s = matrix[f*y][f*x]
        if s == '#'
          count += 1
          occupied << [y, x]
        elsif s == 'L'
          occupied << [y, x]
        end
      end
    end
    f += 1
  end
  puts "occupied: #{occupied}, occ.len: #{occupied.length}" if debug
  return count
end

def updateSeats(seats, debug, tolerance)
  updated = []
  for y in 0..(H-1) do
    row = ''
    for x in 0..(W-1) do
      if tolerance == 4
        c = countInSubMatrix(seats, [x-1, y-1], [x+1,y+1], [x, y], debug)
      else
        if x == 5
          debug = true
        else
          debug = false
        end
        c = countInWiderMatrix(seats, [x-1, y-1], [x+1,y+1], [x, y], debug)
        puts "x: #{x}, y: #{y}, seat: #{seats[y][x]}, c: #{c}"
      end
      if seats[y][x] == 'L' && c == 0
        row += '#'
      elsif seats[y][x] == '#' && c >= tolerance
        row += 'L'
      else
        row += seats[y][x]
      end
    end
    updated << row
  end
  return updated
end

# seats = []
def parts(seats, tolerance)
  debug = false
  newseats = []
  while true do
    newseats = updateSeats(seats, debug, tolerance)
    break if newseats.map { |r| r.count('#') }.reduce(:+) == seats.map { |r| r.count('#') }.reduce(:+)
    seats = copyArray(newseats)
  end
  return seats.map { |r| r.count('#') }.reduce(:+)  
end

puts "Part 1: #{parts(copyArray(INPUT), 4)} "
puts "Part 2: #{parts(copyArray(INPUT), 5)} "
