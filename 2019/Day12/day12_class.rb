# day 12
# * Borrowed: https://github.com/J-Swift/advent-of-code-2019/blob/master/day_12/part_1/solution.rb

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

  def total_energy
    (position[0].abs + position[1].abs + position[2].abs) * (velocity[0].abs + velocity[1].abs + velocity[2].abs)
  end
end

# TESTS DATA
# input = [[-1,0,2], [2,-10,-7], [4,-8,8], [3,5,-1]]  # 10 steps, result is 179
# input = [[-8,-10,0], [5,5,10], [2,-7,3], [9,-8,-3]] # 100 steps, result is 1940

# PART 1 INPUT - 1000 steps, result is 6220
input = [[-4,-9,-3], [-13,-11,0], [-17,-7,15], [-16,4,2]]

moons = []
input.each { |inp| moons << Moon.new(inp) }

# pairs = [[0,1], [0,2], [0,3], [1,2], [1,3], [2,3]]
# 'moons.combination(2).to_a' creates all combinations of pairs (2) from array elements

for t in 1..1000 do
  moons.combination(2).to_a.each do |from, to|
    from.apply_gravity!(to)
  end
  moons.each(&:apply_velocity!)

  # puts "Step #{t}"
  # moons.each { |m| m.show }
end

puts "Part1 = #{moons.map(&:total_energy).reduce(&:+)}"
