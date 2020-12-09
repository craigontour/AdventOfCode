# keywords: __FILE__, case, eval, break, include?

day = File.expand_path(__FILE__).split('/')[-1].split('.')[0]

input = []
File.readlines("#{day}.txt").each { |line| input << line.chomp }

acc = 0
loop = false
i = 0
instructions = []

while !loop do
  break if instructions.include?(i)

  inst, arg = input[i].split(' ')
  instructions << i
  
  case inst
  when 'acc'
    acc += eval(arg)
    i += 1
  when 'nop'
    i += 1
  when 'jmp'
    i += eval(arg)
  end
end

puts "Part 1: #{acc}"

def prompt
  r = readline()
  exit() if r.chomp == 'x'
end

#  ____            _     ____  
# |  _ \ __ _ _ __| |_  |___ \ 
# | |_) / _` | '__| __|   __) |
# |  __/ (_| | |  | |_   / __/ 
# |_|   \__,_|_|   \__| |_____|

i = acc = change_index = change_acc = 0
inst = arg = ''
instructions = []

while i < input.length do
  if instructions.include?(i)
    instructions = instructions[0...change_index]
    inst, arg = input[change_index].split(' ')
    case inst
    when 'nop'
      i = change_index + 1
    when 'jmp'
      i = change_index + eval(arg)
    end
    pp "acc changed back to #{change_acc}"
    acc = change_acc
    change_index = 0
  end

  inst, arg = input[i].split(' ')
  instructions << i

  case inst
  when 'acc'
    acc += eval(arg)
    i += 1
  when 'nop'
    if change_index == 0
      change_index = i
      change_acc = acc
      i += eval(arg)
    else
      i += 1
    end
  when 'jmp'
    if change_index == 0
      change_index = i
      change_acc = acc
      i += 1
    else
      i += eval(arg)
    end
  end

  puts "
  i:#{i}, inst: #{inst}, arg: #{arg}, eval: #{eval(arg)}
  t:#{instructions}
  acc:#{acc}
  change_index:#{change_index}
  "
  # prompt
end

puts "Part 2: #{acc}"
