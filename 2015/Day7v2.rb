# Day 7 2015 - version 2 after i realised my solution did not work for input data
require 'pp'

h = {}
File.readlines('Day7_test.txt').each do |line|
    i = line.split('->')[0].split(' ')
    j = line.split('->')[1].split(' ')[0]

    h[i] ||= []  # Adds to hash i => j, where j is either 
    h[j] ||= []  # https://www.ruby-forum.com/t/the-definitive-list-of-or-equal-threads-and-pages/136446
    h[i] << j
end

f = ''
# until h.empty?
for i in 0..(h.length)
  e = h.select {|k,v| v.empty?}.keys.sort
  pp e
  
#   h.delete(e)
#   h.each {|k,v| v.delete(e)}
#   pp h
end
