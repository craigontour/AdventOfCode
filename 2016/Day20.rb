# Day20
require 'enumerator'

input = File.readlines('Day20_input.txt')
input = File.readlines('Day20_test.txt')
input = input.sort
# f = open('./Day20_ip.txt', 'w')

class Ipaddress
  attr_accessor :a, :b, :c, :d, :ip
  def initialize(addr)
    @a = addr[0]
    @b = addr[1]
    @c = addr[3]
    @d = addr[3]
    @ip = @a.to_s + '.' + @b.to_s + '.' + @c.to_s + '.' + @d.to_s
  end
  def ==(other)
    self.a = other.a
    self.b = other.b
    self.c = other.c
    self.d = other.d
  end
  def <(other)
    return self.a <= other.a && 
      self.b <= other.b && 
      self.c <= other.c &&
      self.d <= other.d
  end
  def >(other)
    return self.a >= other.a && 
      self.b >= other.a && 
      self.c >= other.c &&
      self.d >= other.d
  end
  def to_s
    @ip
  end
end
def pause
  r = gets.chomp
  exit if r == 'x'
end

ordered = []
input.each do |line|
  line.chomp!
  ordered << line.split('-')[0].to_i.to_s(2).rjust(32, "0") + '-' +
    line.split('-')[1].to_i.to_s(2).rjust(32, "0")
end

low = high = '00000000000000000000000000000000' #Ipaddress.new([0,0,0,0])

puts ordered.sort

ordered.sort.each do |line|
  puts "#{low.to_s}-#{high.to_s}"
  puts line
  puts line.split('-')[0] == '00000000000000000000000000000000'
  puts line.split('-')[0] > low
  puts line.split('-')[0] < low
  puts line.split('-')[1] > low
  puts line.split('-')[1] < low

  if line.split('-')[0] <= low
      low = line.split('-')[0]
  else
    if line.split('-')[1] > low
      low = line.split('-')[1]
    else
    end
  end

  # arr = []
  # line.split('-')[0].chars.each_slice(8) { |e| arr << e.join.to_i(2) }
  # a = Ipaddress.new(arr)

  # arr = []
  # line.split('-')[1].chars.each_slice(8) { |e| arr << e.join.to_i(2) }
  # b = Ipaddress.new(arr)

  # puts "#{a}-#{b}"
  # puts "a > part1 : #{a > part1}"
  # puts "a < part1 : #{a < part1}"
  # puts "b > part1 : #{b > part1}"
  # puts "b < part1 : #{b < part1}"

  pause

end

# f.close()
