# keywords: string to binary, 2d array, string substitution

passes = []
seats = Array.new(128) { Array.new(8, 0)}

File.open('day5.txt').readlines().each { |pass|
  bin = pass.chomp.gsub('F','0').gsub('B','1').gsub('R','1').gsub('L','0')
  row = bin[0..6].to_i(2)
  col = bin[7..9].to_i(2)
  passes << (row * 8) + col
  seats[row][col] = 1
}

puts "Part 1: #{passes.max}"

pp seats

# Find the coord which is 0 surrounded by 1s
# Only checked L and R, not F and B, as not required
for y in 1..126 do
  for x in 1..6 do
    if seats[y][x] == 0
      if seats[y+1][x+1] == 1 and seats[y-1][x-1] == 1
        pp y * 8 + x
      end
    end
  end
end
