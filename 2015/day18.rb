# keywords: 2d array, grid, coords

def getLights(f)
  lights = []
  File.readlines(f).each do |line|
    lights << line.chomp
  end
  return lights
end

def printLights(lights)
  lights.each { |l| puts l }
  puts ''
end

def neighbours(lights, x, y)
  s = ''
  # puts "Neighbours for: #{x}, #{y}"
  for yy in y-1..y+1
    for xx in x-1..x+1
      if (xx >= 0 && xx < lights[0].length) &&
        (yy >= 0 && yy < lights.length)
        # puts "line: #{lights[yy]}"
        # pp "xx:#{xx}, yy:#{yy} = #{lights[yy][xx]}"
        s += lights[yy][xx]
      else
        # puts "xx:#{xx}, yy:#{yy} - out of bounds"
      end
    end
  end
  # pp s
  return s
end

def fixPart2(lights, size, part)
  if part == 2
    lights[0][0] = '#'
    lights[0][size-1] = '#'
    lights[size-1][0] = '#'
    lights[size-1][size-1] = '#'
  end
  return lights
end

def changeLights(lights, steps, size, part)
  for step in 0...steps
    newlights = []

    # puts "before"
    # printLights(lights)
    fixPart2(lights, size, part)

    for y in 0..(lights.length-1)
      nl = ''
      for x in 0..(lights[0].length-1)
        n = neighbours(lights, x, y).count('#')
        # puts "n = #{n}"
        if lights[y][x] == '#'
          if n-1 > 1 and n-1 < 4
            nl += '#'
            # pp "x:#{x}, y:#{y} = n:#{n} | ON / ON  : #{lights[y][x]}"
          else
            nl += '.'
            # pp "x:#{x}, y:#{y} = n:#{n} | ON / OFF   : #{lights[y][x]}"
          end
        else
          if n == 3
            nl += '#'
            # pp "x:#{x}, y:#{y} = n:#{n} | OFF / ON   : #{lights[y][x]}"
          else
            nl += '.'
            # pp "x:#{x}, y:#{y} = n:#{n} | OFF / OFF: #{lights[y][x]}"
          end
        end
      end
      newlights << nl
    end
    lights = newlights
    # puts "after"
    # printLights(fixPart2(lights, size, part))
  end
  return fixPart2(lights, size, part)
end

lights = changeLights(getLights('day18.tst'), 4, 6, 1)
sum = 0
lights.each { |l| sum += l.count('#') }
puts "Test 1: #{sum}"

lights = changeLights(getLights('day18.txt'), 100, 100, 1)
sum = 0
lights.each { |l| sum += l.count('#') }
puts "Part 1: #{sum}"

lights = changeLights(getLights('day18.tst'), 5, 6, 2)
sum = 0
lights.each { |l| sum += l.count('#') }
puts "Test 2: #{sum}"

lights = changeLights(getLights('day18.txt'), 100, 100, 2)
sum = 0
lights.each { |l| sum += l.count('#') }
puts "Part 2: #{sum}"
