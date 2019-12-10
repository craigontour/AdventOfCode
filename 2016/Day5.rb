# AofC Day 5 2016
# find lowest numbered MD5 hash for iwrupvqb... which begins 00000 (5 0's)

# Part 1 - find hash with leading 5 0's

require 'digest'
require 'pp'

# Test where answer is 609043 because MD5 hash for abcdef609043 starts with 000001dbbfa... 
# doorID = 'wtnhxymk'
# c = []
# # p Digest::MD5.hexdigest 'abc3231929'

# seed = 0
# while c.length < 8 do
#     seed += 1
#     # get hash of test + seed
#     hash = (Digest::MD5.hexdigest (doorID + seed.to_s))
#     if hash[0,5] == '00000'
#         p "seed=#{seed}, hash=#{hash}, char6=#{hash[5]}"
#         c << hash[5]
#     end
# end
# p c.join

# Part 2

doorID = 'wtnhxymk'
c = []
i = 0
seed = 0
while i < 8 do
    seed += 1
    # get hash of test + seed
    hash = (Digest::MD5.hexdigest (doorID + seed.to_s))
    if hash[0,5] == '00000'
        if hash[5].to_s.match('[0-7]') && c[hash[5].to_i] == nil
            puts "#{hash[0,5]} | pos = #{hash[5]} | c(pos) = #{c[hash[5].to_i]} | #{hash[6]}"
            c[hash[5].to_i] = hash[6]
            i += 1
            pp c
        end
    end
end
pp c.join
