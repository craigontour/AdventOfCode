# Day20
require 'enumerator'

input = File.readlines('Day20_input.txt')
# input = File.readlines('Day20_test.txt')

# f = open('./Day20_2_ip.txt', 'w')

def bin_to_dig(num)
  num.to_i(2).to_s
end
def dig_to_bin(num)
  num.to_s(2).rjust(32, "0")
end
def pause
  r = gets.chomp
  exit if r == 'x'
end

binaries = []
input.each do |line|
  line.chomp!
  binaries << line.split('-')[0].to_i.to_s(2).rjust(32, "0") + '-' +
    line.split('-')[1].to_i.to_s(2).rjust(32, "0")
end

ordered = []
binaries.sort.each do |line|
  ordered << bin_to_dig(line.split('-')[0]) + '-' + bin_to_dig(line.split('-')[1])
end

ip = 0
gaps = []

ordered.each do |line|
  l = line.split('-')[0].to_i
  r = line.split('-')[1].to_i

  if l-ip <= 1
    if r > ip
      ip = r
    end
  else
    # puts "IP : #{ip}"
    # puts "Line: #{l}-#{r}"
    gaps << [ ip+1, l - 1]
    ip = r

    # puts "Ip : #{ip}"
    # puts "Gaps : #{gaps}"
    # pause
  end
end

puts gaps.first
puts gaps.length
