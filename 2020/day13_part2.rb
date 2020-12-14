input = "23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,449,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,13,19,x,x,x,x,x,x,x,x,x,29,x,991,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,17"
# input = "1789,37,47,1889"

schedules = []
input.split(',').each_with_index do |sch, i| 
  schedules << [sch.to_i, i] if sch != 'x'
end

ts = 100000000000000

pp schedules

jump = ts = schedules[0][0]

schedules[1...(schedules.length)].each do |mod, i|
  while (ts + i) % mod != 0 do
    # this means we are increment in multiples of previous mod
    # so each number is divisible by last and so on
    ts += jump
  end
  puts "jump from #{jump} to #{jump * mod}"
  # 
  jump *= mod
end

pp "Part 2: #{ts}"
