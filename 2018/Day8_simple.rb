input = File.readlines('/Users/craig/Dev/AdventOfCode/AofC2018/Day8_input.txt')
dataSet = input[0].split(" ").each.map(&:to_i)
# test 2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2

$metaTotal = 0
$stack = []  # this is array of metas for children nodes

def process(data)

  children = data[0]
  metas = data[1]
  data = data[2..(data.length)]

  for i in (1..children)
    data = process(data)
    $stack << metas      # Add child meta values to stack
  end

  if children == 0
    (0..(metas-1)).each do |i|
      $metaTotal += data[i]
    end
    return data[metas..(data.length)]
  else
    (1..$stack[-1]).each do |i|
      $metaTotal += data[i*-1]
    end
    return data[metas..(data.length-1)]
  end

end

process(dataSet)

puts $metaTotal
