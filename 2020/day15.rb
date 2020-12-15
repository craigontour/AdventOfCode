
@debug = false

tests = [
  [0,3,6], [1,3,2], [2,1,3], [1,2,3], [2,3,1], [3,2,1], [3,1,2]
]
part1 = 2020

input = [2,0,1,7,4,14,18]
part2 = 30000000

def addToSpoken(spoken, ref, value)
  spoken[ref] ||= []
  spoken[ref] << value
  return spoken
end

def play(nums, turns)
  spoken = {}

  nums.each_with_index do |n, i|
    addToSpoken(spoken, n, i+1)
  end

  last = nums[-1]
  turn = nums.length

  until turn == turns do
    turn += 1
    if spoken[last]
      if spoken[last].length == 1
        last = 0
        addToSpoken(spoken, last, turn)
      else
        last = spoken[last][-1] - spoken[last][-2]
        addToSpoken(spoken, last, turn)
      end
    else
      last = 0
      addToSpoken(spoken, last, turn)
    end
  end

  return last
end


# tests.each { |test| pp play(test, part1) } 
# puts "Part 1: #{play(input, part1)}"

# tests.each { |test| pp play(test, part2) } 
puts "Part 2: #{play(input, part2)}"
