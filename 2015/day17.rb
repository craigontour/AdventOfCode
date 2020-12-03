
nums = File.open('day17.txt').readlines().each.map(&:to_i)

nums = [ 20, 15, 10, 5, 5 ]

part1 = []

(2..(nums.length-1)).each do |i|
  puts "Permutations for #{i}"
  nums.permutation(i).each do |p|
    if p.reduce(:+) == 25 && !part1.include?(p.sort)
      puts "
      Part1: #{part1}
      include perm? #{p}"
      part1 << p.sort
    end
  end
end

pp part1

exit()

# def reCalc (arr1, arr2)
#   if arr1.nil?
#     puts "arr1: #{arr1}, arr2: #{arr2}"
#   if arr1.reduce(:+) + arr2[0] == 25
#     puts "#{arr1} + #{arr2} = 25"
#     return arr1 + arr2
#   elsif arr2.length > 1
#     reCalc(arr1 + [arr2[0]], arr2[1..(arr2.length)])
#   else
#     return arr1
#   end
# end
