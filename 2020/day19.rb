data = []
messages = []
rules = {}

File.readlines('day19.tst').each do |line|
  if line.chomp =~ /\d/
    data << line.chomp
  elsif line.chomp.length > 0
    messages << line.chomp
  end
end
puts "data: #{data}"

def processOther(rule, other, rules)
  str = ''
  newrules = {}

  rs = other.split(' ')
  rs.each do |r|
    puts "rule: #{rule}, rules[#{r}].nil? : #{rules[r].nil?}"
    if !rules[r].nil?
      str += rules[r]
    end
  end
  newrules[rule] = str

  
  if str.length == rs.length
    puts "new rules: #{newrules}"
    newrules.each { |rule| rules[rr] = rr[0] }
    return true
  else
    puts "other: #{rs} not all found."
    return false
  end
end

while !data.empty? do
  rule = data.shift
  puts "rule: #{rule}"
  
  rno, sublist = rule.split(': ')

  if sublist =~ /\"[a-z]\"/
    puts "letter: #{sublist[1]}"
    rules[rno] = sublist[1]

  else
    str = ''
    options = sublist.include?(' | ')
    puts "options: #{options} #{options.length}"

    options.each do |option|
      if !processOther(r, options[0], rules) && !processOther(r, options[1], rules)
        data << rule
      end
    else
      data << rule if !processOther(r, other, rules)
    end
    readline()
  end
  
  puts "data now: #{data}"
  puts "rules now: #{rules}"
  puts ""
  
end

puts rules
puts ""

# puts messages
