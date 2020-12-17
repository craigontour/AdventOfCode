
seats = {}

def rangeToArray(range)
  r = range.split('-').map(&:to_i)
  return (r[0]..r[1]).to_a
end

seat, tckt, near = File.read('day16_2.tst').split("\n\n")

seat.split("\n").each do |line|
  d, r1, r2 = line.match("(.+): (.+-.+) or (.+-.+)").captures
  puts "line: #{line}, r1: #{r1}, r2: #{r2}"
  seats[d] = rangeToArray(r1)
  seats[d] += rangeToArray(r2)
end

nearby = []
near.split("\n").each do |line|
  if line =~ /(\d?,)+/
    nearby << line.split(',').map(&:to_i)
  end
end
pp nearby

def checkAllKeys(col, seats)
  seats.keys.each_with_index do |k, i|
    col.each do |n|
      puts "#{k} #{n} : #{seats[k].include?(n)}"
    end
  end
end
  
# for each key
seats.keys.each_with_index do |k, i|
# if k =~ /departure.+/

  # is each column of numbers within the range of the key
  checkAllKeys(nearby.map { |row| row[i] }, seats)

  # end
end

exit()

# pp seats['class']
# puts ""
# pp seats['row']
# puts ""
# pp seats['seat']

tckt.split("\n")[1].split(',').map(&:to_i).sort!.each do |n|
  if seats['class'].include?(n) && !seats['row'].include?(n) && !seats['seat'].include?(n)
    puts "class: #{n}"
  elsif !seats['class'].include?(n) && seats['row'].include?(n) && !seats['seat'].include?(n)
    puts "row: #{n}"
  elsif !seats['class'].include?(n) && seats['row'].include?(n) && seats['seat'].include?(n)
    puts "seat: #{n}"
  end
  # need to find departure keys
  # keys.each do |k|
  #   pp k
  # end
end
