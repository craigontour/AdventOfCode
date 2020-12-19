expressions = ARGF.readlines.map(&:strip)

# Override integer operations
class Integer
  def %(other_integer)
    self + other_integer
  end
end

# Authort's explanation:
# I changed the expressions, substituting + operator into other operators with the same
# (part 1) or higher (part 2) precedence as/than the * operator.
# Then I redefined those operators (I picked % and **) to be a normal addition.
# Then a standard Kernel#eval does the job

puts "part 1"
puts expressions.reduce(0) { |sum, expression|
  puts "expression: #{expression}"
  modified_expression = expression.gsub("+", "%")
  puts "mod exprn : #{modified_expression}"
  sum += eval(modified_expression)
}
