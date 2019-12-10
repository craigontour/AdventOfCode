#Day 19 
#With class of nodes

# Numberphile https://www.youtube.com/watch?v=uCsD3ZGzMgE
puts "Part 1 = #{((3012210 - 2097152) * 2 ) + 1}"

exit

NO_ELVES = 4194304  #3012210 #40
elves = []

class Node
  attr_accessor :id, :presents, :prevElf, :nextElf
  def initialize(id, prevElf, nextElf)
    @id = id
    @presents = 1
    @prevElf = prevElf
    @nextElf = nextElf
  end
  def to_s
    "id:#{@id.to_s} has #{@presents} presents, next is #{@nextElf.id}"
  end
end

def pause
  r = gets.chomp
  exit if r == 'x'
end

for i in 0..NO_ELVES-1 do
  n = Node.new(i, nil, nil)
  elves.push(n)
end
for i in 0..NO_ELVES-1 do
  n = elves[i]
  if i == 0
    n.prevElf = elves[NO_ELVES-1]
    n.nextElf = elves[i+1]
  elsif i == NO_ELVES-1
    n.prevElf = elves[i-1]
    n.nextElf = elves[0]
  else
    n.prevElf = elves[i-1]
    n.nextElf = elves[i+1]
  end
end
def printelves(elves)
  for i in 0..NO_ELVES-1 do
    puts elves[i].to_s
  end
end
# printelves(elves)

loop do

  for i in 0...NO_ELVES do

    n = elves[i]

    # puts i
    # pause

    next if n.presents == 0
    if n.presents == NO_ELVES
      puts "Part 1 answer = #{n.id+1}"
      exit
    end

    # take out next elf
    nxt = n.nextElf
    n.presents += nxt.presents
    nxt.presents = 0
    n.nextElf = nxt.nextElf
    # nxt.nextElf = Node.new(nxt.id, nil, nil)

    # printelves(elves)
  end
end
