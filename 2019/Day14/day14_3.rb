# day14 take 3 - class
require 'pp'

class Chemical
  attr_accessor :amount, :name

  def initialize(input)
    amount, name = input.split(' ')
    @amount = amount.to_i
    @name = name
  end

  # def to_s
  #   puts "Chemical #{@name} = #{@amount}"
  # end
end

class Reaction
  attr_accessor :inputs, :output

  def initialize(str)
    inputs, output = str.split(" => ")

    @inputs = inputs.split(", ").map { |input| Chemical.new(input) }
    @output = Chemical.new(output)
  end

  # def to_s
  #   puts "Reaction #{@output.name} = #{@reaction.inputs}"
  # end
end

reactions = {}

File.readlines('Day14_test_1.txt').each do |line|
  puts "Line: #{line}"
  reaction = Reaction.new(line)
  reactions[reaction.output.name] = [reaction.output.amount, reaction.inputs]
  pp reaction
end

# reactions.each { |r| pp r }
