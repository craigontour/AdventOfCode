require 'pp'

def most_common_character(str)
  return str.                     # returns an array of element, count of occurences
  gsub(/\s/, "").                 # remove whitespace
  chars.                          # convert to array of chars
  group_by{|a| a}.                # group into a hash of character and its occurrences
  map { |e,v| [ e, v.length ] }.  # new hash of characters and count of occurrences 
  sort_by { |e,v| -v }.           # sort into descending frequency order
  max_by{|e,v| v == v}            # get most common pair, alphabetically ordered
end

c = most_common_character("the lazy brawn fax jumped over the mat")
# answer is a, even though e also has 4
pp c
