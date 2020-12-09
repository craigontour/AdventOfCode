# Purpose: create hash reference with to_sym,  
# keywords: map, gsub, match, hash, first, to_sym, unless

# Cheat from https://www.reddit.com/r/adventofcode/comments/k8a31f/2020_day_07_solutions/

BAG_LINES = File.readlines('day7.tst').map{ |line| line.chomp.gsub(/ bags?|[.]/, '') }
BAG_RULES = { }

BAG_LINES.each do |line|
  rule = line.split(" contain ")
  bag = rule.first.to_sym
  BAG_RULES[bag] = []
  pp "Rule: #{rule[1]}"

  rule[1].split(",").each do |b|
    m = b.match(/^ ?(\d+) (\w+ \w+)$/)
    puts "b: #{b} | #{m[2]} , #{m[1]}" unless m.nil?  
    BAG_RULES[bag] << [m[2].to_sym, m[1].to_i] unless m.nil?  
  end
end

puts BAG_RULES
exit()

# Part 1
def containing_bag_count(rules, target_counts, target_bag)
  bag_count_rec = lambda do |bag|
    return 1 if bag == target_bag
    return 0 if rules[bag].empty?
      
    count = 0
    rules[bag].each do |b|
      target_count = target_counts[b.first] < 0 ? b[1] * bag_count_rec.call(b.first) : target_counts[b.first]
    
      target_counts[b.first] = target_count
      count += target_count
    end
  
    count
  end
  
  rules.keys.select { |k| k != target_bag && bag_count_rec.call(k) > 0 }.length
end

shiny_gold_counts = {}
BAG_RULES.keys.each { |k| shiny_gold_counts[k] = -1 }
puts "#{ containing_bag_count(BAG_RULES, shiny_gold_counts, :"shiny gold") }"
