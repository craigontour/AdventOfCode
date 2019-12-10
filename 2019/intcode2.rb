# Re-write with Class in Ruby

# Intcode programs are given as a list of integers; these values are used as the initial state for the computer's memory.
# When you run an Intcode program, make sure to start by initializing memory to the program's values.
# A position in memory is called an address (for example, the first value in memory is at "address 0").

# Instructions:
#  - opcode are beginning of instruction
#  - then parameters
#  - current instruction is pointer

require 'pp'

def get_data
  return INPUT[0].split(',').each.map(&:to_i)
end

class Op
    attr_accessor :opcode, :params

    def initialize (data, opcode, params)
      @data = data
      @opcode = opcode
      @params = params
    end

    def to_s
        puts "Opcode is #{@opcode} with params #{@params}"
    end

    def addOp
      @data[@params[2]] = @data[@params[0]] + @data[@params[1]]
    end

    def multOp
      @data[@params[2]] = @data[@params[0]] * @data[@params[1]]
    end
end

def ITC(data, i, n, v)
  data[1] = n
  data[2] = v

  while data[i] != 99 do
    opcode = data[i]
    params = data[i+1..i+3]
    inout = 0

    op = Op.new(data, opcode, params)
    puts op.to_s if DEBUG

    case opcode
    when 1
      op.addOp
      i += 4
    when 2
      op.multOp
      i += 4
    when 99 # halt
      exit
    end
  end

  return data[0]
end

DEBUG = true

# Part 1
INPUT = File.readlines('Day2_input.txt')
pp INPUT if DEBUG

# DAY 2 PART 1
puts "Day 2 Part 1 = #{ITC(get_data, 0, 12, 2)}"
exit

# DAY 2 PART 2 - pair of inputs for addresses 1 and 2 to produce output = 1960720
for n in 0..99 do
  for v in 0..99 do
    # initialise memory to programs values - DATA input needs reloading
    if ITC(get_data, 0, n, v) == 19690720
      puts "Day 2 Part 2 = #{100 * n + v}"
      exit
    end
  end
end
