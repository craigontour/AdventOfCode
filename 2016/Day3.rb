require 'pp'

# Part 1
tris = 0

File.read('Day3_input.txt').strip.each_line do |l|
    a, b, c = l.strip.split(' ').map(&:to_i)
    tris = a + b > c && c + b > a && a + c > b ? tris += 1 : tris
end

pp tris


# Part 2
part2 = 0

input = File.readlines('Day3_input.txt')

for i in 0...(input.length/3)
    a = [0,0,0]
    b = [0,0,0]
    c = [0,0,0]
    for j in 0..2
        x= i*3+j
        # puts "x = #{x}"

        items = input[i*3+j].strip.split(' ').map(&:to_i)
        a[j] = items[0]
        b[j] = items[1]
        c[j] = items[2]
        puts "a = #{a}, b = #{b}, c = #{c}"

        part2 = a[0] + a[1] > a[2] && a[1] + a[2] > a[0] && a[2] + a[0] > a[1] ? part2 += 1 : part2
        part2 = b[0] + b[1] > b[2] && b[1] + b[2] > b[0] && b[2] + b[0] > b[1] ? part2 += 1 : part2
        part2 = c[0] + c[1] > c[2] && c[1] + c[2] > c[0] && c[2] + c[0] > c[1] ? part2 += 1 : part2
    end
end

pp part2
