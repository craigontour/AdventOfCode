# Day 16
# TAG: Dragon curve, involution, binary negate
require 'pp'
require 'date'

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

def show_the_involution(a)
    puts "--- Show involution ---"
    puts "This function is an involution where: f(f(a)) == a"

    puts a
    puts a.reverse
    b = reverse_and_negate(a)
    puts b
    puts

    a = b

    puts a
    puts a.reverse
    b = reverse_and_negate(a)
    puts b
    puts "--- Done involution ---"
    puts
end
# show_the_involution(a)

loop do
    t1 = Time.now.to_i

    a = a + '0' + reverse_and_negate(a)
    t2 = Time.now.to_i
    puts "length = #{a.length} in #{t2-t1} secs"

    if a.length >= disk_length
        a = a[0..disk_length-1]
        puts "  length = #{a.length}"

        loop do
            t1 = Time.now.to_i
            chk = ''
            (0..(a.length-1)).step(2) do |i|

                # puts "#{i} => #{a[i]}, #{a[i+1]}"
                if a[i] == a[i+1]
                    chk += '1'
                else
                    chk += '0'
                end
            end
        
            if chk.length % 2 == 1
                puts "Answer = #{chk}"
                exit
            end
            a = chk
            t2 = Time.now.to_i
            puts "length = #{a.length} in #{t2-t1} secs"
        end

        puts "Error: shouldn't have got here."
        exit
    end
end
