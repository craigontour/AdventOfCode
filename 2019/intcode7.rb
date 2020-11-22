# Re-write with Class in Ruby

# Intcode programs are given as a list of integers; these values are used as the initial state for the computer's memory.
# When you run an Intcode program, make sure to start by initializing memory to the program's values.
# A position in memory is called an address (for example, the first value in memory is at "address 0").

# Instructions:
#  - opcode are beginning of instruction
#  - then parameters
#  - current instruction is pointer

# PROBLEM is DATA needs to be accessible globally
# define as $data ?
# RE-THINK the Intcode as taking diagnostic program in inputs
# and then calling main loop function to iterate and process

require 'pp'

def get_data(input)
  return input[0].split(',').each.map(&:to_i)
end

def pause
  r = gets.chomp
  exit if r =='x'
end

class Op
  attr_accessor :instr, :opcode, :params, :modes

  def initialize (instr, opcode, params)
    @instr = instr
    @opcode = opcode
    @params = params
    @modes = [(@opcode/100) % 10, (@opcode/1000) % 10, (@opcode/10000) % 10]
  end

  # debuugging
  def printInstr
    puts "Instr 00-09:  #{instr[0..9]}"
    puts "Instr 10-19:  #{instr[10..19]}"
    puts "Instr 20-29:  #{instr[20..29]}"
    # puts "Instr 30-39:  #{instr[30..39]}"
    # puts "Instr 40-49:  #{instr[40..49]}"
  end

  def to_s
    printInstr
    puts "Opcode: #{@opcode}"
    puts "Params: #{@params}"
    # puts "Modes:  #{@modes}"
  end

  def getInstr(i)
    return @instr[i]
  end

  def setInstr(i, v)
    @instr[i] = v
  end
  # debugging

  def resolvep(n)
    if @modes[n] == 0
      return getInstr(@params[n])
    else
      return @params[n]
    end
  end

  # Opcode 1 - add params 1 & 2, store in 3
  def addOp
    setInstr(@params[2], resolvep(0) + resolvep(1))
  end

  # Opcode 2 - multiple params 1 & 2, store in 3
  def multOp
    setInstr(@params[2], resolvep(0) * resolvep(1))
  end

  # Opcode 3 - store the Input value in param 1
  def inputOp(input)
    setInstr(@params[0], input)
  end

  # Opcode 4 - get param 1 value and Output
  def outputOp
    return resolvep(0)
  end

  # Opcode 5 - if param 1 <> 0 sets the Pointer to param 2
  def jumpTrue(i)
    if resolvep(0) != 0
      i = resolvep(1)
    else
      i+3
    end
  end

  # Opcode 6 - if param 1 == 0 sets the Pointer to param 2
  def jumpFalse(i)
    if resolvep(0) == 0
      i = resolvep(1)
    else
      i + 3
    end
  end

  # Opcode 7 - if param 1 < param 2, stores 1 in param 3, else stores 0
  def lessThan
    if resolvep(0) < resolvep(1)
      setInstr(@params[2], 1)
    else
      setInstr(@params[2], 0)
    end
  end

  # Opcode 8 - if param 1 == param 2, stores 1 in param 3, else stores 0
  def equals
    resolvep(0) == resolvep(1)? setInstr(@params[2], 1) : setInstr(@params[2], 0)
  end

  def result(n)
    return @instr[n]
  end
end

def intcode(data, inputs)
  i = output = x = 0

  while data[i] != 99 do
    op = Op.new(data, data[i], data[i+1..i+3])

    puts "Op = #{op.opcode}"
    puts "Params = #{op.params}"

    case op.opcode % 100
    when 1
      op.addOp
      ##### try returning pointer increment from class method
      i += 4
    when 2
      op.multOp
      i += 4
    when 3
      op.inputOp(inputs[x])
      i += 2
      x += 1
    when 4
      output = op.outputOp
      i += 2
    when 5
      i = op.jumpTrue(i)
    when 6
      i = op.jumpFalse(i)
    when 7
      op.lessThan
      i += 4
    when 8
      op.equals
      i += 4
    when 99 # halt
      puts "Shouldn't get here!!"
      exit
    end
  
    p "data = #{data}"
    p "output = #{output}"
  end

  pause
  return data, output
end

$debug = true

# Tests
data = [3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0]
# data = [3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0]
# data = [3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0]
# data = File.readlines('day7_input.txt').map(&:strip)[0].split(",").map(&:to_i)

# DAY 7 PART 1
def amplifier1(data, sequence)
  output = 0
  sequence.each do |phase|
    data, output = intcode(data, [phase, output])
  end
  return output
end

outputs = []
[0,1,2,3,4].permutation(5).to_a.each { |sequence|
  # outputs << amplifier1(data, sequence)
}
# p outputs.max


# DAY 7 PART 2
# 
def amplifier2(data, sequence)
  output = 0

  sequence.each do |phase|
    data, output = intcode(data, [phase, output])
  end

  return output
end

data = [3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5]
p amplifier2(data, [9,8,7,6,5])
