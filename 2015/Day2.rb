# Part 1
total = 0
File.readlines('Day2_input.txt').each do |b|
    sides = []
    sides << b.split('x')[0].to_i
    sides << b.split('x')[1].to_i
    sides << b.split('x')[2].to_i
    sides = sides.sort
    # puts sides.sort, '-----'
    area = (3*sides[0]*sides[1]) + (2*sides[1]*sides[2]) + (2*sides[0]*sides[2]) #+ (sides[0]*sides[1])
    # puts "#{b} area = " + area.to_s
    total += area
end
puts "Part 1 = #{total}"


# Part 2
total = 0
File.readlines('Day2_input.txt').each do |b|
    sides = []
    sides << b.split('x')[0].to_i
    sides << b.split('x')[1].to_i
    sides << b.split('x')[2].to_i
    sides = sides.sort
    ribbon = (2*sides[0]) + (2*sides[1]) + (sides[0]*sides[1]*sides[2])
    total += ribbon
end
puts "Part 2 = #{total}"
