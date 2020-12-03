
# Match
# Sue 380: perfumes: 4, samoyeds: 1, akitas: 7

rules = {
  'children': 3,
  'cats': 7,
  'samoyeds': 2,
  'pomeranians': 3,
  'akitas': 0,
  'vizslas': 0,
  'goldfish': 5,
  'trees': 3,
  'cars': 2,
  'perfumes': 1,
}

File.open('day16.txt').readlines().each_with_index do |line, i|
  things, qty = line.match('([a-z]*):\s([0-9]+),\s([a-z]*):\s([0-9]+),\s([a-z]*):\s([0-9]+)').
    captures.
    partition.each_with_index{ |el, x| x.even? }
  
  qty = qty.map(&:to_i)
  
  # puts "#{i+1}: #{things}: #{qty}"
  ans = []
  things.each do |cond|
    ans << rules[:"#{cond.split(':')[0]}"]
  end
  puts "Part 1: #{i+1}" if ans == qty
end

# cats and trees >
# pomeranians and goldfish <

File.open('day16.txt').readlines().each_with_index do |line, i|
  things, qty = line.match('([a-z]*):\s([0-9]+),\s([a-z]*):\s([0-9]+),\s([a-z]*):\s([0-9]+)').
    captures.
    partition.each_with_index{ |el, x| x.even? }
  
  qty = qty.map(&:to_i)
  
  # puts "#{i+1}: #{things}: #{qty}"
  ans = []
  things.each_with_index do |cond, j|
    if ['cats', 'trees'].include?(cond)
      ans << true if qty[j] > rules[:"#{cond.split(':')[0]}"]
    elsif ['pomeranians', 'goldfish'].include?(cond)
      ans << true if qty[j] < rules[:"#{cond.split(':')[0]}"]
    else
      ans << true if qty[j]== rules[:"#{cond.split(':')[0]}"]
    end
  end
  puts "Part 2: #{i+1}" if ans.count(true) == 3
end
