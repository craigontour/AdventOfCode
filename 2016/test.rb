input = '...^^^^^..^...^...^^^^^^...^.^^^.^.^.^^.^^^.....^.^^^...^^^^^^.....^.^^...^^^^^...^.^^^.^^......^^^^'
input = '.^^.^.^^^^'
p input
p input.size

row = input.each_char.reduce(0) { |i, c| i << 1 | (c == ?^ ? 1 : 0) }
p row

p row.to_s(2).count(?1)

puts (row << 1).to_s(2)
puts (row >> 1).to_s(2)
