# keywords: hash, match, gsub, recursion

bags = {}
contents = {}

File.open('day7.tst').readlines().each do | line|
  line = line.chomp.gsub(/ bags?|[.]/,'')
  l, r = line.split(' contain ')
  bags[l] = []

  # puts "l:#{l}, r:#{r}"
  
  r.split(",").each do |b|
    p = b.match(/ ?(\d+) (\w+ \w+)/)
    puts "#{b} | #{p[1]} , #{p[2]}" unless p.nil?
    bags[l] << [p[1].to_i, p[2]] unless p.nil?
  end
end

puts bags

def bagValue(bag, bags)
  puts "b: #{b}"

  if b.include?('shiny gold')
    return q
  else
    bags[b].each do |o|
      nn = bagValue(o, , bags)
      puts "#{spaces}> nn: #{nn}"
    end
  end
end

bags.each do |k, v|
  puts "> k:#{k}, v:#{v}"

  contents[k] = []
  v.each do |bag, q|
    n = bagValue(bag, q, bags)
    puts "> n: #{n}"
    contents[k] << [o,n]
  end

  exit()
end

contents.each { |c| pp c }