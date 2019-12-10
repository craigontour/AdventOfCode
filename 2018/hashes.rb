
a = { "A" => 1, "B"=>2, "C"=>3, "D"=>4, "E"=>5, "F"=>6 }
puts a

puts "key for value"
puts a.key(2)

puts "All keys"
puts a.keys
# or
a.each {|k,v| puts k}

puts "value for key"
puts a.fetch("D")

puts "All keys"
puts a.values
# or
a.each {|k,v| puts v}
