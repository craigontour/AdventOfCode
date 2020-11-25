# AofC Day 4 2015
# find lowest numbered MD5 hash for iwrupvqb... which begins 00000 (5 0's)

# Part 1 - find hash with leading 5 0's
# Part 2 - find hash for 6 0's

require 'digest'
require 'pp'

# Test where answer is 609043 because MD5 hash for abcdef609043 starts with 000001dbbfa... 
# p Digest::MD5.hexdigest 'abcdef609043'

exit

seed = 0
mdfound = false

until mdfound
  seed += 1

  # get hash of test + seed
  new = Digest::MD5.hexdigest('iwrupvqb' + seed.to_s)[0, 6]

  if new[0,5] == '00000'
    p seed
    if new == '000000'
      mdfound = true
      p seed
    end
  end
end
