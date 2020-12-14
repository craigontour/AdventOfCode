# keywords: array count down downto, 

INPUT = []
File.open('day11.txt').readlines().each { |line| INPUT << line.chomp }
@h = INPUT.length
@w = INPUT[0].length
@debug = false #true #

def prompt
  r = readline()
  exit() if r == "x\n"
end

def copyArray(arr)
  newArr = []
  arr.each_with_index { |el, i| newArr << arr[i] }
  return newArr
end

def checkFree(vertices)
  free = 0
  puts "checkfree: vertices: #{vertices}" if @debug

  vertices.each do |el|
    if el == 'L'
      break
    elsif el == '#'
      free = 1
      break
    end
  end
  return free
end

def vectorFree(seats, seatX, seatY)
  count = 0
  puts "seatY: #{seatY}, seatX: #{seatX} = #{seats[seatY][seatX]}" if @debug

  puts "\nV E R T I C A L S" if @debug
  col = seats.map { |r| r[seatX] }
  count += checkFree(col[0..(seatY-1)].reverse) if seatY > 0
  puts "V1 #{col[0..(seatY-1)].reverse} : #{count}" if @debug
  count += checkFree(col[(seatY+1)..(@h-1)]) if seatY < @h-1
  puts "V2 #{col[(seatY+1)..(@h-1)]} : #{count}" if @debug

  puts "\nH O R I Z O N T A L S" if @debug
  count += checkFree(seats[seatY][0..(seatX-1)].chars.reverse) if seatX > 0
  puts "H1 #{seats[seatY][0..(seatX-1)].chars.reverse} : #{count}" if @debug
  count += checkFree(seats[seatY][(seatX+1)..(@w-1)].chars) if seatX < @w-1
  puts "H2 #{seats[seatY][(seatX+1)..(@w-1)].chars} : #{count}" if @debug

  puts "\nL-R D I A G O N A L S" if @debug
  x = seatX-1
  y = seatY-1
  vertices = []
  while !(x < 0 || y < 0) do
    # puts "x: #{x}, y: #{y} : #{seats[y][x]}" if @debug
    vertices << seats[y][x]
    x -= 1
    y -= 1
  end
  count += checkFree(vertices)

  x = seatX+1
  y = seatY+1
  vertices = []
  while x < @w && y < @h do
    # puts "x: #{x}, y: #{y} : #{seats[y][x]}" if @debug
    vertices << seats[y][x]
    x += 1
    y += 1
  end
  count += checkFree(vertices)

  puts "\nR-L D I A G O N A L S" if @debug
  x = seatX+1
  y = seatY-1
  vertices = []
  while x < @w && !(y < 0) do
    # puts "x: #{x}, y: #{y} = #{seats[y][x]}" if @debug
    vertices << seats[y][x]
    x += 1
    y -= 1
  end
  count += checkFree(vertices)

  x = seatX-1
  y = seatY+1
  vertices = []
  while !(x < 0) && y < @h do
    # puts "x: #{x}, y: #{y} = #{seats[y][x]}" if @debug
    vertices << seats[y][x]
    x -= 1
    y += 1
  end
  count += checkFree(vertices)
  puts "final count: #{count}" if @debug

  return count
end

def updateSeats(seats)
  updated = []
  
  for y in 0..(@h-1) do
    row = ''
    
    for x in 0..(@w-1) do
      c = vectorFree(seats, x, y)
      puts "row: #{seats[y]} | x:#{x}, y:#{y} | occupies: #{c}" if @debug
      prompt if @debug

      if seats[y][x] == 'L' && c == 0
        row += '#'
      elsif seats[y][x] == '#' && c >= 5
        row += 'L'
      else
        row += seats[y][x]
      end
    end
    
    updated << row
  end
  return updated
end

newseats = []
seats = copyArray(INPUT)

# vectorFree(INPUT, 0, 0)
# exit()

while true do
  newseats = updateSeats(seats)
  # puts newseats
  prompt if @debug
  break if newseats.map { |r| r.count('#') }.reduce(:+) == seats.map { |r| r.count('#') }.reduce(:+)
  seats = copyArray(newseats)
end

puts "Part 2:"
puts seats.map { |r| r.count('#') }.reduce(:+)
