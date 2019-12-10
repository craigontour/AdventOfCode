require 'pp'

$bots = {} # hash of bot and values
$inst = [] # array of hashes of bot, low and high
$outs = {} # outputs

def moveChip(bot, loOut, loNum, hiOut, hiNum, lowV, highV)
  if loOut == "bot"
    $bots[loNum] ||= []
    $bots[loNum] << lowV
  else
    $outs[loNum] ||= []
    $outs[loNum] << lowV
  end
  if hiOut == "bot"
    $bots[hiNum] ||= []
    $bots[hiNum] << highV
  else
    $outs[hiNum] ||= []
    $outs[hiNum] << highV
  end
  $bots[bot].pop
  $bots[bot].pop
end

input = File.read('Day10_input.txt')

# input = File.read('Day10_test.txt')
input.each_line { |line|
    items = line.chomp.split(/\W/)
    if items.length == 6
      $bots[items[5].to_i] ||= []
      $bots[items[5].to_i] << items[1].to_i #vals
    else
      hsh = Hash.new()
      # { "bot" => 152, "lout" = "bot|output", "lonum" => 155, "hout" => "bot|output", "hinum" => 70}
      hsh["bot"] = items[1].to_i
      hsh["lout"] = items[5]
      hsh["lonum"] = items[6].to_i
      hsh["hout"] = items[10]
      hsh["hinum"] = items[11].to_i
      $inst.push(hsh)
    end
}
pp "Bots =>"
pp $bots

arr = ['bot','lout','lonum','hout','hinum']

def log_bots
  f = open('bots.txt', 'w')
  $bots.each do |b|
    f.write(b)
  end
end

def log_inst(s)
  if s == ''
    f = open('inst.txt', 'w')
    $inst.each do |i|
      f.write(i)
    end
  else
    f = open('inst.txt', 'w')
    f.write(s)
  end
end

while $inst.length > 0
  pp "Inst length = #{$inst.length}"

  $inst.each do |move|
    log_inst(move)
    bot, loOut, loNum, hiOut, hiNum = move.values_at(*arr).compact

    if $bots[bot] != nil && $bots[bot].count == 2  # bot in bots and has 2 chips
      lowV, highV = $bots[bot].sort

      puts "Insts before => #{$inst.length}"
      # pp $inst
      # puts

      pp "bot #{bot} gives #{lowV} to #{loOut} #{loNum} & #{highV} to #{hiOut} #{hiNum}"
      moveChip(bot, loOut, loNum, hiOut, hiNum, lowV, highV)

      puts "bots =>"
      pp $bots
      puts

      puts "outs =>"
      pp $outs
      puts

      $inst.shift

      puts "Inst shifted => #{$inst.length}"
      gets
    end
  end
end

pp "Bots => "
pp $bots
puts

pp "Output => "
pp $outs.sort
puts

# arr = ['bot','low','high']
# hsh.values_at(*arr).compact
# is same as...
# bot = hsh["bot"]
# low = hsh["low"]
# high = hsh["high"]
