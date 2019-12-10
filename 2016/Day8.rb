require 'pp'

grid = Array.new(6) { Array.new(50, '.') }
pp grid

File.readlines('Day8_input.txt').each do |line|
  # pp line.chomp
  if (line.include?('rect'))
    x, y = line.split(' ')[1].split('x')
    for j in 0...y.to_i
      for i in 0...x.to_i
        grid[j][i] = 'X'
      end
    end
  elsif (line.include?('column'))
    c, shift = line.chomp.split('=')[1].split(' by ')
    # get column as array
    row = grid.map.each_with_index { |col, i| col[c.to_i] }
    new = row.slice(row.length-shift.to_i, shift.to_i) + row.slice(0, row.length-shift.to_i)
    new.map.each_with_index { |v, i| grid[i][c.to_i] = v }
  elsif (line.include?('row'))
    r, shift = line.chomp.split('=')[1].split(' by ')
    row = grid[r.to_i]
    grid[r.to_i] = row.slice(row.length-shift.to_i, shift.to_i) + row.slice(0, row.length-shift.to_i)
  end
end

# Part 1
pp grid.each.sum { |a| a.count{ |el| el == 'X' } }

# Part 2

def printGrid(grid)
  for j in 0...6
    s = ''
    for i in 0...50
      s += grid[j][i]
    end
  puts s
  end
end

printGrid(grid)
