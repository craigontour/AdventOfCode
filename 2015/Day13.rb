h = {}

me = 'Craig'

File.readlines('Day13_input.txt').each do |line|
  parts = line.chomp[0..-2].split(' ')
  a = parts[0]
  units = if parts[2] == 'gain'
            parts[3].to_i
          else
            -parts[3].to_i
          end
  b = parts[-1]
  # puts "#{a}#{b}:#{units}"
  # h[a + b] = units
  (h[a] ||= {})[b] = units

  # part 2
  if me != ''
    (h[a] ||= {})[me] = 0
    (h[me] ||= {})[a] = 0
  end
end

t = h.keys.permutation.map { |p|
  (p << p[0]).each_cons(2).map { |a, b|
    h[a][b] + h[b][a]
  }.reduce(:+)
  # puts "Perm: #{p} = #{t}"
}

if me == ''
  puts "Part 1: #{t.max}"
else
  puts "Part 2: #{t.max}"
end
