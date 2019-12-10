# Day 19

# This takes a few hours to run

NO_ELVES = 3012210 #5

def pause
  r = gets.chomp
  exit if r == 'x'
end

elves = Array.new(NO_ELVES)

for i in 0...NO_ELVES do
  elves[i] = i
end
def printelves(elves)
  for i in 0..NO_ELVES-1 do
    puts elves[i]
  end
end

loop do

    if elves.length == 1
      puts "Part 2 = #{elves[0]+1}"
      # Answer i got was 1417887
      exit
    else
      if elves.length % 100000 == 0
        puts elves.length / 100000
      end
    end

    mid = elves.length / 2
    # puts "elves = #{elves.length} : mid = #{mid}"
    m = elves[mid]
    # puts "#{n.id} takes from elf #{m.id}"
    elves.delete_at(mid)

    # puts
    # printelves(elves)

    b = elves.shift
    elves.push(b)


end
