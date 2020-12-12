def prompt
  r = readline()
  exit if r == "x\n"
end

test = false #true #
if test
  input = [1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19].insert(0, 0)
  input = File.read('day10.tst').split("\n").map(&:to_i).sort!.insert(0, 0)
  input.push(input[-1]+3)
else
  input = File.read('day10.txt').split("\n").map(&:to_i).sort!.insert(0, 0)
  input.push(input[-1]+3)
end

# pp input

puts "Part 1:"
puts (0...(input.length-1)).each
                            .map { |a| input[a+1]-input[a] }
                            .group_by { |n| n }
                            .map { |e, v| v.length }
                            .reduce(:*)

#  ____            _     ____  
# |  _ \ __ _ _ __| |_  |___ \ 
# | |_) / _` | '__| __|   __) |
# |  __/ (_| | |  | |_   / __/ 
# |_|   \__,_|_|   \__| |_____|

routes = {}
routes[0] = 1
input.each { |a|
  next if a == 0
  # puts("a:, #{a}")
  routes[a] = 0
  routes[a] += routes[a-1] if !routes[a-1].nil?
  routes[a] += routes[a-2] if !routes[a-2].nil?
  routes[a] += routes[a-3] if !routes[a-3].nil?
  # puts "routes: #{a} = #{routes[a]}"
  # routes[a] = routes[a-1] + routes[a-2] + routes[-3]
}

puts "Part 2: #{routes.max}"

# Starting at index 1 find how many adapters can be connected in sequence

