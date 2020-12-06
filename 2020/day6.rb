# keywords: match, captures

c = 0
r = ''
content = File.readlines('day6.txt')

for i in 0..(content.length) do

  if i == content.length
    if r.length > 0
      c += r.chars.sort.uniq.length
      puts "r:#{r}, length:#{r.length}, c:#{c}"
    end
    break
  end
  
  line = content[i]
  puts "i:#{i}, line:#{line.chomp}, length:#{line.chomp.length}"

  if line.chomp.length == 0
    c += r.chars.sort.uniq.length
    puts "r:#{r}, length:#{r.length}, c:#{c}"
    r = ''
    next
  end

  r += line.chomp
end

pp c