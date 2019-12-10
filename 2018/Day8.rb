# Input
input = File.readlines('/Users/craig/Dev/AdventOfCode/AofC2018/Day8_input.txt')
# Test data
# input = File.readlines('Day8_test.txt')
dataSet = input[0].split(" ").each.map(&:to_i)
 
def process(data)
  children = data[0]
  metas = data[1]
  data = data[2..(data.length)]
  totals = 0
  scores = []
  sumOf = 0

  for i in (1..children)
    total, score, data = process(data)
    totals += total
    scores << score
  end

  (0..(metas-1)).each do |i|
    totals += data[i]
  end

  if children == 0
    (0..(metas-1)).each do |i|
      sumOf += data[i]
    end
    return totals, sumOf, data[metas..(data.length)]
  else
    if metas > 0 && metas <= scores.length
      (0..(metas-1)).each do |i|
        sumOf += scores[i]
      end
    end
    return totals, sumOf, data[metas..(data.length)]
  end

end

total, value, remaining = process(dataSet)

puts 'Answer is ' + total.to_s
