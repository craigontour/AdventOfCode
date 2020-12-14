# get index of max element in array

# timestamp = 1008832 #939#
# # @schedules = [ 7, 13, 59, 31, 19 ]
# # times = [ 7, 13, 59, 31, 19 ]
# @schedules = [23, 41, 449, 13, 19, 29, 991, 37, 17]
# times = [23, 41, 449, 13, 19, 29, 991, 37, 17]

# nobus = true
# time = 0

# while nobus do
#   time += 1
#   times.each_with_index do |el, i|
#     times[i] += (time / el) * @schedules[i]
#     nobus = false if time >= timestamp
#   end
# end

# bus = times.each_with_index.min
# puts "Part 1: #{@schedules[bus[1]] * (bus[0]- timestamp)}"

input = "23,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,449,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,13,19,x,x,x,x,x,x,x,x,x,29,x,991,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,17"

tests = [
  [ "7,13,x,x,59,x,31,19", 1068788 ],
  [ "17,x,13,19", 3417],
  [ "67,7,59,61", 754018 ],
  [ "67,x,7,59,61", 779210 ],
  [ "67,7,x,59,61", 1261476 ],
  # [ "1789,37,47,1889", 1202161486 ]
]

timestamp = 100000000000000

def GetSchedules(input)
  schedules = []
  input.split(',').each_with_index do |sch, i| 
    schedules << [sch.to_i, i] if sch != 'x'
  end
  return schedules
end

def GetTimestamp(schedules)
  nobus = true
  time = 0

  while nobus do
    buses = 0
    time += 1

    schedules.each do |bus, i|
      buses += (time+i) % bus
    end

    # pp "#{time}: #{buses}"
    nobus = false if buses == 0
  end
  return time
end

tests.each_with_index do |testdata, i|
  start = Time.now
  result = GetTimestamp(GetSchedules(testdata[0]))
  puts "Test #{i+1}. Result: #{result}, expected: #{testdata[1]} in #{Time.now - start} secs"
end

start = Time.now
part2 = GetTimestamp(GetSchedules(input))
puts "Part 2: result = #{part2} in #{Time.now - start} secs"
