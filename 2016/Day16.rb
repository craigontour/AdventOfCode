# Day 16
require 'pp'

a =  '01111010110010011'
length = 272 #35651584 

# step 1
b = a.reverse

loop do
    d = ''
    b.each_char do |c|
        d += c == '1' ? '0' : '1'
    end
    a = a + '0' + d

    if a.length >= length
        a = a[0..length-1]
        loop do
            chk = ''
            # puts "a = #{a} | #{a.length}"
            for i in 0..(a.length/2-1) do
                # puts "#{i} : #{a[i*2]} = #{a[i*2+1]}"
                if a[i*2] == a[i*2+1]
                    chk += '1'
                else
                    chk += '0'
                end
            end
            # puts chk
            # puts '0111110101'

            if chk.length % 2 == 1
                puts chk
                exit
            end
            a = chk
        end
    end
    puts "a needs to be #{length} long, but is #{a.length} long"
    b = a.reverse
end
