# 2016 Day 14
# TAGS: md5, hashes, .times, regex match
require 'digest'
require 'pp'

#SALT = 'abc'
SALT = 'ahsbgdzn'

def write_to_log(hashes)
    f = open('day14_hashes.txt', 'w')
    hashes.each do |h, i|
      f.write("#{i} = #{h}")
    end
end

def solve1
    i = 0
    keys = 0

    loop do
        # get hash of SALT#{i}
        h = Digest::MD5.hexdigest ("#{SALT}#{i}")

        # check for a triplet
        m = h.match('([a-z0-9])\1\1')

        # found a triplet of characters
        # look for a quintet of same character in next 1000 hashes
        if m != nil
            # puts "#{i} hash '#{h}' has 3 x #{m.to_s[0]}'s"
            for j in (i+1)..(i+1000) do
                h = Digest::MD5.hexdigest ("#{SALT}#{j}")
                if h.match("(#{m.to_s[0]}){5}") != nil
                    # puts "  #{j} hash '#{h}' has 5 x #{m.to_s[0]}'s"
                    keys += 1
                    return i if keys == 64 
                end
            end
        end
        i += 1
    end
end
# Test
# puts "Part 1 ('#{SALT}') = #{solve1}"

def md5_stretched(i)
    hash = Digest::MD5.hexdigest ("#{SALT}#{i}")
    2016.times { hash = Digest::MD5.hexdigest (hash) }
    hash
end

def solve2
    i = 0
    count = 0

    loop do
        # get hash of SALT#{i}
        h = md5_stretched(i)

        # check for a triplet
        m = h.match('([a-z0-9])\1\1')

        # found a triplet of characters
        # look for a quintet of same character in next 1000 hashes
        if m != nil
            # puts "#{i} hash '#{h}' has 3 x #{m.to_s[0]}'s"
            for j in (i+1)..(i+1000) do
                h = md5_stretched(j)
                if h.match("(#{m.to_s[0]}){5}") != nil
                    puts "#{i} -> #{j} hash '#{h}' has 5 x #{m.to_s[0]}'s"
                    count += 1
                    return i if count == 64 
                end
            end
        end
        i += 1
    end
end
puts "Part 2 ('#{SALT}') = #{solve2}"
