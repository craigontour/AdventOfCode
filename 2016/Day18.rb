# Day 18

input = '.^^.^.^^^^'
input = '...^^^^^..^...^...^^^^^^...^.^^^.^.^.^^.^^^.....^.^^^...^^^^^^.....^.^^...^^^^^...^.^^^.^^......^^^^'

def pause
  r = gets.chomp
  exit if r =='x'
end

[40,400000].each do |tile_count|

  tiles = []
  tiles << input

  for j in 1...tile_count do
    line = tiles[j-1]
    # p "Tile #{j} = #{line}"

    row = ''

    for i in 0...line.length do
      if i == 0
        s = '.' + line[i..(i+1)]
      elsif i == (line.length-1)
        s = line[(i-1)..i] + '.'
      else
        s = line[(i-1)..(i+1)]
      end
      
      if s =~ /\^{2}[^\^]/  # L & C
        row += '^'
      elsif s =~ /[^\^]\^{2}/ # R & C
        row += '^'
      elsif s =~ /[\^][^\^]{2}/ # L only
        row += '^'
      elsif s =~ /[^\^]{2}[\^]/ # R only
        row += '^'
      else
        row += '.'
      end
    end
    # puts row
    # pause
    tiles << row
  end
  p tiles.length

  safe = 0
  for i in 0..(tile_count-1) do
    # p "#{i}:#{tiles[i]}:#{tiles[i].count('.')}:#{tiles[i].length}"
    safe += tiles[i].count('.')
  end

  puts "Safe for #{tile_count} = #{safe}"
end
