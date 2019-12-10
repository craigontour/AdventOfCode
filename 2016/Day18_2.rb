input = ARGV.first || '...^^^^^..^...^...^^^^^^...^.^^^.^.^.^^.^^^.....^.^^^...^^^^^^.....^.^^...^^^^^...^.^^^.^^......^^^^'

row = input.each_char.reduce(0) { |i, c| i << 1 | (c == ?^ ? 1 : 0) }
mask = 2 ** input.size - 1

safe = input.size - row.to_s(2).count(?1)

39.times {
  row = ((row << 1) ^ (row >> 1)) & mask
  p row
  safe += input.size - row.to_s(2).count(?1)
}

puts safe
