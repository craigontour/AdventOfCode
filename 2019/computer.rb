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
  
  def getInstr(i)
    return @instr[i]
  end

  def setInstr(i, v)
    @instr[i] = v
  end

  def resolvep(n)
    if @modes[n] == 0
      return getInstr(@params[n])
    else
      return @params[n]
    end
  end

  def addOp #1
    setInstr(@params[2], resolvep(0) + resolvep(1))
  end

  def multOp #2
    setInstr(@params[2], resolvep(0) * resolvep(1))
  end

  def inputOp(input) # 3
    setInstr(@params[0], input)
  end

  def outputOp #4
    return resolvep(0)
  end
  
  def jumpTrue(i) #5
    if resolvep(0) != 0
      i = resolvep(1)
    else
      i+3
    end
  end

  def jumpFalse(i) #6
    if resolvep(0) == 0
      i = resolvep(1)
    else
      i + 3
    end
  end

  def lessThan #7
    if resolvep(0) < resolvep(1)
      setInstr(@params[2], 1)
    else
      setInstr(@params[2], 0)
    end
  end

  def equals #8
    resolvep(0) == resolvep(1)? setInstr(@params[2], 1) : setInstr(@params[2], 0)
  end

  def result(n)
    return @instr[n]
  end
end

def ITC(data, i, input)  
 
  while data[i] != 99 do
    op = Op.new(data, data[i], data[i+1..i+3])

    if $debug
      puts "before i: #{i}, input : #{input}"
      op.to_s
    end

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
    data = op.instr
  end

  return input
end

$debug = false
file = 'Day7_input.txt'
puts "Day 7 Part 1 = #{ITC(get_data(File.readlines(file)), 0, 5)}"
