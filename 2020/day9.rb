

input = File.open('day9.txt').readlines().map(&:to_i)

preamble = 25
i = part1 = 0

pre = input[0..(preamble-1)]

(preamble...input.length).each_with_index do |num, i|
  num = input[i+preamble]
  # puts "
  # i  : #{i}
  # pre: #{pre}
  # num: #{num}
  # "
  
  c = pre.combination(2).select { |a, b| 
    # puts "#{a}+#{b}=#{num} : #{a + b == num}"
    a + b == num
  }.count
  # puts "#{num} : #{c}"
  if c == 0
    part1 = input[i+preamble]
    break
  end
  
  pre.shift
  pre.push(num)
end
puts "Part 1: #{part1}"

# PART 2

contig = []

(0...input.length).each do |i|
  x = i
  contig = []
  
  while contig.inject(0){|sum, y| sum + y} < part1
    contig << input[x]
    x += 1
  end

  if contig.inject(0){|sum, y| sum + y} == part1
    break
  end
end

puts "Part 2: #{contig.sort} = #{contig.sort.first + contig.sort.last}"
