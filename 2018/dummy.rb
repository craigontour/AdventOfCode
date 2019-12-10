input = File.readlines('dummy.txt')
data = input[0].split(" ").each.map(&:to_i)
puts data.length
