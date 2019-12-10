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

  def resolvep(n)
    if @modes[n] == 0
      return @instr[@params[n]]
    else
      return @params[n]
    end
  end
  
  def addOp #1
    @instr[@params[2]] = resolvep(0) + resolvep(1)
  end

  def multOp #2
    @instr[@params[2]] = resolvep(0) * resolvep(1)
  end

  def inputOp(input) # 3
    puts "pos in param0 is #{@instr[@params[0]]} = #{input}"
    @instr[@params[0]] = input
  end

  def outputOp #4
    return resolvep(0)
  end
  
  def jumpTrue(i) #5
    puts "i = if #{resolvep(0) != 0} then #{resolvep(1)} else #{i+3}"
    if resolvep(0) != 0
      puts "op5: jumpTrue != 0, so i = #{resolvep(1)}"
      i = resolvep(1)
    else
      puts "op5: jumpTrue == 0, so i = #{i+3}"
      i+3
    end
  end

  def jumpFalse(i) #6
    puts "i = if #{resolvep(0) == 0} then #{resolvep(1)} else #{i+3}"
    if resolvep(0) == 0
      i = resolvep(1)
    else
      i + 3
    end
  end

  def lessThan #7
    puts "#{@instr[@params[2]]} = if #{resolvep(0)} < #{resolvep(1)} then 1 else 0"
    if resolvep(0) < resolvep(1)
      @instr[@params[2]] == 1
    else
      @instr[@params[2]] == 0
    end
  end

  def equals #8
    puts "#{@instr[@params[2]]} = if #{resolvep(0)} == #{resolvep(1)} then 1 else 0"
    if resolvep(0) == resolvep(1)
      puts "op8: equals is true, so #{@params[2]} = 1"
      printInstr
      @instr[@params[2]] == 1
      printInstr
      pause
    else
      puts "op8: equals is false, so #{@params[2]} = 0"
      @instr[@params[2]] == 0
    end
  end

  def result(n)
    return @instr[n]
  end
end

def ITC(data, i, input)  
 
  while data[i] != 99 do
    op = Op.new(data, data[i], data[i+1..i+3])

    puts "before i: #{i}, input : #{input}" if $debug
    op.to_s if $debug

    case op.opcode % 100
    when 1
      op.addOp
      i += 4
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
      pp "op5-before: i is #{i}"
      i = op.jumpTrue(i)
      pp "op5-after: i is now #{i}"
    when 6
      i = op.jumpFalse(i)
    when 7
      op.lessThan
      i += 4
    when 8
      pp "op8-before: i is #{i}"
      op.equals
      i += 4
      pp "op8-after: i is now #{i}"
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
    data = op.instr
  end

  return input
end

$debug = true

# Day 2 - test the build - chamge input to day2_input and run this
# file = 'Day2_input.txt'
# puts "Day 2 Part 1 = #{ITC(get_data(File.readlines(file)), 0, 12, 2, 0)}"

# pause

file = 'Day5_input.txt'

# DAY 5 PART 1
# puts "Day 5 Part 1 = #{ITC(get_data(File.readlines(file)), 0, 0, 0, 1)}"

# DAY 5 PART 2
test = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99]

puts "Day 5 Test 2 = #{ITC(test, 0, 8)}"
# puts "Day 5 Part 2 = #{ITC(get_data(File.readlines(file)), 0, 5)}"
