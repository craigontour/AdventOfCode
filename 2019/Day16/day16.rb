# Day 16 FFT
# Borrowed few bits including use nums and nth from: 
# https://github.com/Kache/advent_of_code/blob/8ee09f0889873dea5d4fde32ebcd160b5a2dd8b7/2019/solutions.rb#L599
# Logic is mainly mine

nums = []
# read input as single digits
File.readlines('Day16_input.txt').each do |line|
  nums = line.chars.map { |n| n.to_i }
end
p nums
BASE_PATTERN = [0, 1, 0, -1]

def repeat_pattern(i, length)
  # puts "1: #{i}, #{length}"

  s = []
  BASE_PATTERN.each do |el|
    (1..i).each { s << el }
  end
  s = s[1..(s.length-1)].append(s[0])
  # puts "2: #{s}"

  s
end

def pause
  r = gets.chomp
  exit if r == "x"
end

100.times do |phase|
  b = []

  (1..nums.size).map do |nth|
    patt = repeat_pattern(nth, nums.size)
    # puts "3: #{patt.length}"

    sum = 0
    (nth..(nums.size)).each do |n|
      # p "#{n}-4: #{n}"
      # p "#{n}-5: #{nums[n-1]}"
      # p "#{n}-6: #{(n-1) % patt.length}"
      # p "#{n}-6: #{patt[(n-1) % patt.length]}"
      sum += nums[n-1] * patt[(n-1) % patt.length]
    end
    # pause
    b << sum.abs % 10
  end

  p "After Phase #{phase+1}: #{b}"

  nums = b
  # pause
end

puts nums.first(8).join
