puts File.read('Day3_input.txt').strip.each_line.count {|line|
  a, b, c = *line.strip.split.map(&:to_i)
  a + b > c and a + c > b and b + c > a
}