# Day20
require 'enumerator'

input = File.readlines('Day20_input.txt')
f = open('./Day20_sort.txt', 'w')

def pause
  r = gets.chomp
  exit if r == 'x'
end

input.sort_by { |l| l.chomp.split('-')[0] }

f.write(input)
f.close()
