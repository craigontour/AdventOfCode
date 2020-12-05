# keywords: args, combination, reduce product, sum
# data = [
  # 1721,
  # 979,
  # 366,
  # 299,
  # 675,
  # 1456
# ]

# Pass 2 or 3 as argument for Part 1 or 2 respectively, i.e. ruby day1.rb 2
File.readlines('day1.txt').each.
  map(&:to_i).
  combination(ARGV[0].to_i).each { |pair|
    puts pair[0..-1].reduce(:*) if pair.sum == 2020
  }

exit()

#  _____ _          _           _   _                       _   
# |  ___(_)_ __ ___| |_    __ _| |_| |_ ___ _ __ ___  _ __ | |_ 
# | |_  | | '__/ __| __|  / _` | __| __/ _ \ '_ ` _ \| '_ \| __|
# |  _| | | |  \__ \ |_  | (_| | |_| ||  __/ | | | | | |_) | |_ 
# |_|   |_|_|  |___/\__|  \__,_|\__|\__\___|_| |_| |_| .__/ \__|
#                                                    |_|        

# Brute force, needs editing between parts
data = File.readlines('day1.txt').each.map(&:to_i)

data.each_with_index do |n, i|
  data.each_with_index do |m, j|
    data.each_with_index do |o, k|
      next if i == j && j == k

      if n + m + o == 2020
        # puts "n: #{n} + m: #{m} + o:#{o} = #{n+m+o}"
        puts m * n * o
        exit()
      end
    end
  end
end
