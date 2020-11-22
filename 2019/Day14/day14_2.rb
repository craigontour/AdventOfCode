# Day14 attempt 2

ores = []
reactions = []
fuel = []
amount = 1

File.readlines('Day14_test_1.txt').each do |line|
  puts "Line: #{line}"

  if line.include?("ORE")
    l = line.split(' => ')[0].split(' ')
    r = line.split(' => ')[1].split(' ')
    ore = {r[1] => [r[0].to_i, l[0]]}
    # puts ore,''
    ores << ore
  elsif line.include?("FUEL")
    l = line.split(' => ')[0].split(',')
    r = line.split(' => ')[1].split(' ')
    amount = r[0]
    eq = []
    l.each do |react|
      eq << [react.split(' ')[0].to_i, react.split(' ')[1]]
    end
    # puts eq,''
    fuel += eq
  else
    l = line.split(' => ')[0].split(',')
    r = line.split(' => ')[1].split(' ')
    eq = []
    l.each do |react|
      eq << [react.split(' ')[0].to_i, react.split(' ')[1]]
    end
    reaction = {r[1] => [r[0].to_i, eq]}
    # puts reaction,''
    reactions << reaction
    end
end

puts ''
puts "ORES are #{ores[0]}..",''
puts "REACTIONS are #{reactions[0]}..",''
puts "FUEL to calculate is #{fuel}..",''

fuel.each do |r|
  puts "react = #{r[1]}"
  if ores[0][r[1]]
    puts "Found ore #{ores[0][r[1]]}"
  elsif reactions[0][r[1]]
    puts "Found reaction #{reactions[0][r[1]]}"
  end
end