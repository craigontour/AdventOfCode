# day 12

moons = [
  [[-1,0,2],[0,0,0]],
  [[2,-10,-7],[0,0,0]],
  [[4,-8,8],[0,0,0]],
  [[3,5,-1],[0,0,0]]
]
PAIRS = [[0,1], [0,2], [0,3], [1,2], [1,3], [2,3]]

def show(moon)
  position = moon[0]
  velocity = moon[1]
  puts "pos=<x=#{position[0]}, y=#{position[1]}, z=#{position[2]}>, vel=<x=#{velocity[0]}, y=#{velocity[1]}, z=#{velocity[2]}>"
end

def pause
  c = gets.chomp
  exit if c == 'x'
end

def update_moons(m1, m2)
  for a in 0..2 do
    if (m1[0][a] < m2[0][a])
      puts "#{a}: #{m1[0][a]} < #{m2[0][a]}"
      m1[1][a] += 1
      m2[1][a] -= 1
    elsif m1[0][a] > m2[0][a]
      puts "#{a}: #{m1[0][a]} > #{m2[0][a]}"
      m1[1][a] -= 1
      m2[1][a] += 1
    end
  end
  return m1, m2
end

def update_velocity_apply_gravity(moons)
  new_moons = moons
  # foreach axis

  for pair in PAIRS do
    update_moons(moons[pair[0]], moons[pair[1]])
  end
  
  # return new_moons

end

puts "After 0 steps:"
moons.each { |m| show(m) }
puts

for t in 1...10 do
  moons = update_velocity_apply_gravity(moons)

  puts "After #{t} steps:"
  moons.each { |m| show(m) }

  pause
end

