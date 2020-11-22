
# Part 2
require 'set'

class Moon
  attr_accessor :position, :velocity

  def initialize (position)
    @position = position
    @velocity = [0,0,0]
  end

  def show
    puts "pos=<x=#{position[0]}, y=#{position[1]}, z=#{position[2]}>, vel=<x=#{velocity[0]}, y=#{velocity[1]}, z=#{velocity[2]}>"
  end

  # *Borrowed
  def apply_gravity!(other)
    for i in 0..2 do
      d = position[i] - other.position[i]
      if d < 0
        velocity[i] += 1
        other.velocity[i] -= 1
      elsif d > 0
        velocity[i] -= 1
        other.velocity[i] += 1
      end
    end
  end

  # *Borrowed
  def apply_velocity!
    position[0] += velocity[0]
    position[1] += velocity[1]
    position[2] += velocity[2]
  end

end

# TESTS DATA
# input = [[-1,0,2], [2,-10,-7], [4,-8,8], [3,5,-1]]  # 10 steps, result is 179
input = [[-8,-10,0], [5,5,10], [2,-7,3], [9,-8,-3]] # 100 steps, result is 1940

# PART 1 INPUT - 1000 steps, result is 6220
# input = [[-4,-9,-3], [-13,-11,0], [-17,-7,15], [-16,4,2]]

moons = []
input.each { |inp| moons << Moon.new(inp) }

def chksum(moons)
  str = ""
  for moon in moons do
    for i in 0..2 do
      str += moon.position[i].to_s
    end
    for i in 0..2 do
      str += moon.velocity[i].to_s
    end
  end
  # puts str
  return str
end

chksums = Set.new
chksums << chksum(moons)
same = false
t = 1

until same do
  moons.combination(2).to_a.each do |from, to|
    from.apply_gravity!(to)
  end
  moons.each(&:apply_velocity!)

  chk = chksum(moons)
  puts "Step #{t} = #{chk}, #{chksums.length}"

  if chksums.include? chk
    same = true
  else
    chksums << chk
  end

  t += 1
  if t % 1000000000 == 0
    puts t
  end
  if t > 4686774924
    puts "Gone too far"
    break
  end
end

puts "Step 2: #{chksums.length}"
puts chksums.inspect
puts chksums.reduce(1, :lcm)