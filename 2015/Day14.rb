# keywords: hash, max_by, select

race = 2503
h = {}

File.readlines('Day14_input.txt').each do |line|
  parts = line.split(' ')
  
  a = parts[3].to_i  #flying distance
  b = parts[6].to_i  #travel time
  c = parts[13].to_i #rest
  d = parts[0]       #reindeer
  # puts "Reindeer: #{d}, flies at #{a} for #{b} with #{c} rest"
  
  h ||= []
  h[d] = { 'km': a, 'for': b , 'rest': c, 'next': 1, 'score': 0, 'dist': 0 }
end

# pp h

# Part 1
# h.each do |k, v|
#   cc = distance = 0
#   while cc + v[:b] < 2503 do
#     cc += v[:b]
#     distance += v[:a] * v[:b]
#     cc += v[:c]
#   end

  # x = (race / (b + c)).to_i
  # y = (race - ((b + c) * x))
  # z = if y > b
  #       1
  #     else
  #       0
  #     end

  # h ||= []
  # h[d] = (x + z) * (a*b)
  # puts "Distance travelled: #{h[d]}
  # "
# end

def getNext(sec, v)
  if sec <= v[:for]
    x = y = sec % v[:for]
  else
    x = (sec / (v[:for] + v[:rest])).to_i
    y = (sec - ((v[:for] + v[:rest]) * x)) % v[:for]
  end
  
  if y == 0
    v[:rest] + 1
  else
    1
  end
end

# Part 2
(1..2503).each do |sec|
  h.each do |k, v|
    # puts "Sec: #{sec}"
    if v[:next] == sec
      v[:dist] += v[:km]
      v[:next] += getNext(sec, v)
    end
  end
  max_dist = h.max_by { |k, v| v[:dist] }[1][:dist]
  leaders = h.select { |k, v| v[:dist] == max_dist }.map { |d| d[0] }
  leaders.each { |l| h[l][:score] += 1 }
  # pp "Leaders: #{leaders}"
  if sec % 200 == 0
    puts "Sec: #{sec}"
    h.each { |k, v| puts "#{k}: #{v}" }
    readline()
  end
end

pp h