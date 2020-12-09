# keywords: json, gsub match, reduce, inject

require 'json'

data = File.read('Day12_input.txt')

# Part 1 - find all number and sum
# pp data.gsub(/[^-0-9]+/, ' ').split(' ').map(&:to_i).reduce(:+)
# or
# pp data.gsub(/[^0-9]+/, ' ').split(' ').map(&:to_i).inject { |sum, n| sum + n }

# Part 2 - find { .. red .. }  and subtract from Part 1
json = JSON.parse(data)

def printJson(j)
  j.each do |k, v|
    pp "k: #{k}"
    pp "v: #{v}"
    pp printJson(v)
    readline()
  end
end

printJson(json)
exit()

total = subtotal = 0

def checkRed(j)
  readline()
  # if j.to_s.match('red')
  #   # pp 'red found'
  #   if j != 'red'
  #     j.each do |o|
  #       checkRed(o)
  #     end
  #   else
  #     return 0
  #   end
  # else
  #   s = j.to_s.gsub(/[^-0-9]+/, ' ').split(' ').map(&:to_i)
  #   num = j.to_s.gsub(/[^-0-9]+/, ' ').split(' ').map(&:to_i).reduce(:+).to_i
  #   # total += subtot if subtot != nil
  #   # pp "red not found. num: #{num} in #{s}"
  #   return num
  # end
end

json.each do |j|
  subtotal = checkRed(j)
  pp "Total = #{total} + #{subtotal}"
end

pp "Part2: #{total}"
