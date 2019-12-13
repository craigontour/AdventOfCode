# Cheat from: https://github.com/J-Swift/advent-of-code-2019/blob/master/day_07/part_1/solution.rb

def read_inputs
  File.readlines('day7_input.txt').map(&:strip)[0].split(",").map(&:to_i)
end

def main
  program = read_inputs

  max = [0,1,2,3,4].permutation do |permutation|
    pp permutation
    last_output = 0
    permutation.each do |i|
      on_output = ->(x) { last_output = x }

      # icp = IntCodeProgram.new(program.dup, Input::StaticInputSource.new([i, last_output]), Output::CallbackOutputSource.new(on_output))
      # icp.run!
    end
    pp last_output
  end
  # puts max.inspect

  # last_output = 0
  # max.each do |i|
  #     on_output = ->(x) { last_output = x }

  #     icp = IntCodeProgram.new(program.dup, Input::StaticInputSource.new([i, last_output]), Output::CallbackOutputSource.new(on_output))
  #     icp.run!
  # end
  # puts last_output
end

main
