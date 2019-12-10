# Day 16 TAGS: Dragon curve, involution, binary negate, milliseconds
require 'pp'
require 'date'
t1 = Time.now

def reverse_and_negate(num)
    rev = num.reverse
    bit_len = num.length
    num_ints = 1 << bit_len
    bit_mask = num_ints - 1
    return (bit_mask - rev.to_i(2)).to_s(2).rjust(num.length, '0')
end

a = '01111010110010011'
# disk_length = 272
disk_length = 35651584
invert = 2097152 #16
chkSize = 17

until a.length >= disk_length do
    b = reverse_and_negate(a)
    a = a + '0' + b
end

a = a[0..disk_length-1]
# puts "  length = #{a.length}"

chk = ''
(0..(chkSize-1)).each do |l|
    s = l * invert
    e = (l * invert) + (invert-1)

    ip = a[s..e].count('1')
    chk += (ip % 2 == 0 ? '1' : '0')
end

puts chk
t2 = Time.now
# puts '00100111000101111' # check test answer
puts (t2 - t1) * 1000.0