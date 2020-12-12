# keywords: Manhattan, hash, array for directions

@pX, @pY, @direction = 0, 0, 90

def manhattan
  return @pX.abs + @pY.abs
end

def moveForward(distance)
  case @direction
  when 0
    @pY -= distance
  when 90
    @pX += distance
  when 180
    @pY += distance
  when 270
    @pX -= distance
  end
end

def rotate(d)
  @direction = (@direction + d) % 360
end

input = File.read('day12.txt').split("\n")

def part1(instructions)
  instructions.each do |line|
    action, b = line.match('([A-Z])([0-9]+)').captures
    d = b.to_i
    
    case action
    when 'F'
      moveForward(d)
    when 'R'
      rotate(d)
    when 'L'
      rotate(-d)
    when 'N'
      @pY -= d
    when 'E'
      @pX += d
    when 'S'
      @pY += d
    when 'W'
      @pX -= d
    end
    # puts "@dir:#{@dir} | a:#{action} & #{d} => #{@pX}, #{@pY}"
  end

  return manhattan
end

puts "Part 1: #{part1(input)}"

#
# PART 2
#

@pX, @pY, @direction = 0, 0, 90
@wayX, @wayY = 10, -1

def moveForward(distance)
  puts "  forward #{distance}"
  @pX += distance * @wayX
  @pY += distance * @wayY
end

def rotate(d)
  puts "  rotate #{d}"
  ((d % 360)/ 90).times do |r|
    temp = -@wayY
    @wayY = @wayX
    @wayX = temp
  end
end

puts "Start:
pX: #{@pX}, pY: #{@pY}
wayX: #{@wayX}, wayY: #{@wayY}
"

def part2(instructions)
  instructions.each do |line|
    action, b = line.match('([A-Z])([0-9]+)').captures
    d = b.to_i

    puts "action:#{action}, d:#{d}"
    case action
    when 'F'
      moveForward(d)
    when 'N'
      @wayY -= d
    when 'E'
      @wayX += d
    when 'S'
      @wayY += d
    when 'W'
      @wayX -= d
    when 'R'
      rotate(d)
    when 'L'
      rotate(-d)
    end
    puts "pX:#{@pX}, pY:#{@pY}, wayX:#{@wayX}, wayY:#{@wayY}
  "
  end

  return manhattan
end

puts "Part 2: #{part2(input)}"