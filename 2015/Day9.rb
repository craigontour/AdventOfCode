# keywords: hash, ||=, permutations, 
h = {}

File.readlines('Day9_input.txt').each do |line|
  parts = line.split(' ')
  a = parts[0]
  b = parts[2]
  units = parts[4]
  # h[a + b] = units
  # h[b + a] = units
  (h[a] ||= {})[b] = units.to_i
  (h[b] ||= {})[a] = units.to_i
end

# pp h

t = h.keys.permutation.map { |p|
  p.each_cons(2).map { |a, b|
    h[a][b]
  }.reduce(:+)
  # puts "Perm: #{p} = #{t}"
}

puts "Part 1: #{t.min}"
puts "Part 2: #{t.max}"
