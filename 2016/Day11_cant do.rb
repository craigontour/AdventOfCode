require 'pp'
# Day 11 - Breadth First Search (BFS)

queue = []

# input = File.readlines('Day11_input.txt')
floor = 0
File.read('Day11_test.txt').each_line do |line|
    words = line.chomp.split(/\W/)
    fl = []
    for c in 0..words.length
        puts "Word #{c}"
        # w = words[c]
        # case w
        # when 'generator'
        #     fl << 'gen-' + words[c-1]
        # when 'microchip'
        #     fl << 'mic-' + words[c-2]
        # when 'nothing'
        #     fl = []
        # end
    end

    queue[floor] = fl
    floor += 1
end
pp queue
totalItems = queue.length

exit

elev = []
goodStates = [['GH', 'MH'], ['GL', 'ML']]
elevStates = [['GH'], ['MH'], ['GL'], ['ML'], ['GH', 'MH'], ['GL', 'ML']]

puts queue
puts goodStates
puts elevStates

exit

# start
f = 0

until queue[3].count == totalItems

    # on this floor
    #   look ahead to next floor
    #   determine who can i put on elev
    #   add to elev safe state of items
    #   move to next floor
    #   state of this flooe
    #   remove items from elev
    # repeat

    f += 1
end
