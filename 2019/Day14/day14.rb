# This puzzle uses recursion to determine the 

def pause
  r = gets.chomp
  exit if r == 'x'
end

ores = {}
queue = {}
fuel = []

File.readlines('Day14_test_1.txt').each do |line|
  if line.include?("ORE")
    l = line.split(' => ')[0].split(' ')
    r = line.split(' => ')[1].split(' ')
    ores[r[1]] ||= []
    ores[r[1]] << [r[0], l[0]]
  elsif line.include?("FUEL")
    l = line.split(' => ')[0].split(',')
    r = line.split(' => ')[1].split(' ')
    fuel = l
  else
    l = line.split(' => ')[0].split(',')
    r = line.split(' => ')[1].split(' ')
    queue[r[1]] ||= []
    queue[r[1]] << [r[0], l]
  end

end

puts ores, ''
puts queue, ''
puts fuel, ''

$total = $extra = 0

def reaction(a, h, q, ores)
  puts "hash   is #{h}"

  if ores[h] != nil
    puts "reqd : #{a}"
    b = ores[h][0][0].to_i
    f = ores[h][0][1].to_i
    if a > b
      x = a / b + 1
      r = (x * b) - a
    else a < b
      x = a / b
      r = 0
    end
    puts "fuel for #{h} = #{x} * #{f} = #{x * f}, with #{r} extra"
    $total += x * f
    $extra = r
  else
    puts "queue  is #{q[h]}"
    for r in q[h][0][1]
      puts "go deeper for #{r}",''
      p = r.split(' ')
      reaction(p[0].to_i, p[1], q, ores)
    end
  end
end

for f in fuel
  # puts f.split(' ')[0]
  # puts f.split(' ')[1]
  reaction(f.split(' ')[0].to_i, f.split(' ')[1], queue, ores)
  puts "Total fuel = #{$total}"
  puts "Total extra = #{$extra}"
  pause
end
