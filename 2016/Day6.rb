# Day 6
require 'pp'
# require 'benchmark/ips'

arr = []
File.read('Day6.txt').each_line { |line| arr << line.chomp.chars }
arr = arr.transpose

# PART 1
arr.each do |a|
  # pp a.join.chars.sort.map { |c| [c, a.count(c)] }.to_h).map(|k,v|) { v }
  pp a.group_by { |x| x }.
  map { |element, matches| [element, matches.length]}.
  to_h.sort_by{|e,v| -v}.
  max_by{|k,v| v}[0]
end
puts

# PART 2
arr.each do |a|
  pp a.group_by { |x| x }.
  map { |element, matches| [element, matches.length]}.
  to_h.sort_by{|e,v| -v}.
  min_by{|k,v| v}[0]
end
