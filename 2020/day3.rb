
def getInput(t)
  return File.open("day3.#{t}").readlines()
end

def getSlopes(input, slopes)
  w = input[0].chomp.length
  treeCount = []
  slopes.each do |slope|
    x = y = trees = 0
    # puts "slope: #{slope}"
    input.each_with_index do |line, i|
      if y <= input.length && y == i
        # puts "i:#{i}, x:#{x}, y:#{y}, pos:#{x % w}, l: #{line.chomp} = #{line[x % w]}"
        trees += 1 if line[x % w] == '#'
        x += slope[0]
        y += slope[1]
      end
    end
    treeCount << trees
  end
  pp treeCount
  return treeCount.reduce(:*)
end

puts "Part 1: #{getSlopes(getInput('txt'), [ [1, 1], [3, 1], [5, 1], [7, 1], [1, 2] ])}"
