
# Debugging
def prompt
  r = readline()
  exit() if r == "x\n"
end

input = File.open('day18.tst').readlines()

total = 0

def doSum(sum, op, num)
  if op != ''
    prev = sum
    sum = eval "#{sum} #{op} #{num}"
    puts "eval: #{sum} #{op} #{num} = #{sum}"
  else
    sum = num
    puts "set sum: #{sum}"
  end
  return sum
end

def calcSum(cs)
  op = ''
  sum = 0

  puts "cs: #{cs}"

  i = 0
  while i < cs.length do
    c = cs[i]

    if c == '+' || c == '*'
      # set operator
      puts "op: #{op}"
      op = c
      i += 1

    elsif c =~ /\(\d+/
      # calculate sum in brackets
      puts "cs bracket: #{cs[i..(cs.length)]}"
      puts "cs join   : #{cs[i..(cs.length)].join(' ')}"
      puts "cs match  : #{cs[i..(cs.length)].join(' ').match(/(\(.*\))/).captures[0]}"
      puts "cs less (): #{cs[i..(cs.length)].join(' ').match(/(\(.*\))/).captures[0][1..-2]}"
      newcs = cs[i..(cs.length)].join(' ').match(/(\(.*\))/).captures[0][1..-2]
      puts "#{sum} #{op} #{newcs}"
      sum = doSum(sum, op, calcSum(newcs.split(' ')))
      i += (newcs.length + 2)
      puts "next: i:#{i}, #{cs[i..(cs.length-1)]}"
      prompt
    
    else
      # number
      puts "num: #{sum} #{op} #{c.to_i}"
      sum = doSum(sum, op, c.to_i)
      op = ''
      i += 1
    end

    puts "end: i: #{i}"
    prompt
  end
  return sum
end

input.each do |line|
  calc = 0
  calc += calcSum(line.chomp.split(' '))
  puts "#{line.chomp} = #{calc}"
  total += calc
  prompt
end
