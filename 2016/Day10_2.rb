require 'pp'

bots = {}
inst = {}
outs = {}

def give_chips(bots, outs, bot, low, high, lowV, highV)
  loOut, loNum = low.split(' ')
  hiOut, hiNum = high.split(' ')

  # pp "[moveChip] bot #{bot} gives #{lowV} to #{loOut} #{loNum}"
  # pp "[moveChip] bot #{bot} gives #{highV} to #{hiOut} #{hiNum}"

  # Move low chip
  if loOut == "bot"
    bots[loNum.to_i] ||= []
    bots[loNum.to_i] << lowV
  else
    outs[loNum.to_i] ||= []
    outs[loNum.to_i] << lowV
  end
  # Move high chip
  if hiOut == "bot"
    bots[hiNum.to_i] ||= []
    bots[hiNum.to_i] << highV
  else
    outs[hiNum.to_i] ||= []
    outs[hiNum.to_i] << highV
  end
  bots.delete(bot.to_i)
end

input = File.read('Day10_input.txt')
# input = File.read('Day10_test.txt')

input.each_line do |line|
  case line
  when /bot (\d+) gives low to ((?:bot|output) \d+) and high to ((?:bot|output) \d+)/
    bot, to_low, to_high = $1, $2, $3
    bot = bot.to_i
    inst[bot] ||= []
    inst[bot] << to_low
    inst[bot] << to_high
  when /value (\d+) goes to bot (\d+)/
    val, bot = $1, $2
    bot = bot.to_i
    bots[bot] ||= []
    bots[bot] << val.to_i # Must be an int or the sort does not work
  end
end

while inst.length > 0
  # print out order in which the inst are processed
  inst.each do |i|
    next if bots[i[0]] == nil
    # restartInst = false

    b = bots[i[0]]

    if b.length == 2
      b_lo, b_hi = b.sort { |a,b| a <=> b }

      # pp "[instLoop] bot #{i[0]} gives #{b_lo} to #{i[1][0]}"
      # pp "[instLoop] bot #{i[0]} gives #{b_hi} to #{i[1][1]}"
      give_chips(bots,outs,i[0],i[1][0],i[1][1],b_lo,b_hi,)

      if b_lo.to_i == 17 && b_hi.to_i == 61
        puts "Answer is bot no. #{i[0]}"
      end

      inst.delete(i[0])

      # restartInst = true 
    end
    # break if restartInst
  end
end

pp "Bots => #{bots}"
pp "Inst => #{inst}"
pp "Outs => #{outs}"

pp outs[0][0] * outs[1][0] * outs[2][0]

# reddit
# https://www.reddit.com/r/adventofcode/comments/5hijk5/2016_day_10_solutions/
# https://www.reddit.com/r/adventofcode/comments/5hiyon/2016_day_10pythondot_graph_of_day_10/

# Topo sort
# https://www.geeksforgeeks.org/topological-sorting/
