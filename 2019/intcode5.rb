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
    puts "Instr 30-39:  #{instr[30..39]}"
    puts "Instr 40-49:  #{instr[40..49]}"
  end

  def to_s
    printInstr
    puts "Opcode: #{@opcode}"
    puts "Params: #{@params}"
    puts "Modes:  #{@modes}"
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

def intcode(data, i, input)
 
    while data[i] != 99 do
    op = Op.new(data, data[i], data[i+1..i+3])

    if $debug
      puts "before i: #{i}, input : #{input}"
      op.to_s
    end

    case op.opcode % 100
    when 1
      op.addOp
      ##### try returning pointer increment from class method
      i += 4
      ##### try returning pointer increment from class method
    when 2
      op.multOp
      i += 4
    when 3
      op.inputOp(input)
      i += 2
    when 4
      input = op.outputOp
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
      exit
    end

    if $debug
      puts "after i: #{i}, input : #{input}"
      op.to_s
      pause 
    end

    # Updates to the data instr are done within the op class object
    # so need to use that set for next op, else loads original set
    # data = op.instr
  end
  
  return input

end

$debug = false
file = 'Day5_input.txt'

# DAY 5 PART 1
puts "Day 5 Part 1 = #{intcode(get_data(File.readlines(file)), 0, 1)}"

# DAY 5 PART 2
test = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]

# puts "Day 5 Test 2 = #{ITC(test, 0, 7)}"
puts "Day 5 Part 2 = #{intcode(get_data(File.readlines(file)), 0, 5)}"
