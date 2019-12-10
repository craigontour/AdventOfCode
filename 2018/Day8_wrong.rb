# Input
input = File.readlines('Day8_input.txt')
# Test data
# input = File.readlines('Day8_test.txt')
data = input[0].split(" ").each.map(&:to_i)

$logFile = File.open("Day8_output.txt", "w")
def write_to_log(msg)
  $logFile.puts msg
end

write_to_log('Data input length =' + String(data.length))

metaTotal = 0
loop = 1  # fails at 3354

until data.empty? || loop == 3353 do
  write_to_log('Loop = ' + loop.to_s)

  children = data[0]
  metadata = data[1]
  rest = data[2..(data.length)]

  write_to_log '  -- c=' + children.to_s + ' | m=' + metadata.to_s + ' | rest.length =' + rest.length.to_s

  if children > 0
    (1..metadata).each do |x|
      metaTotal += rest[-x]
      write_to_log '  ---- Has children.......'
      write_to_log '  ---- metadata value:' + String(rest[-x])
    end
    data = rest[0..((rest.length)-metadata-1)]
    write_to_log '  ---- data.length=' + String(data.length)
  else
    (0..(metadata-1)).each do |c|
      write_to_log '  ++++ Childless.......'
      write_to_log '  ++++ metadata value:' + String(rest[c])
      metaTotal += rest[c]
      
    en
    data = rest[metadata..(rest.length)]
    write_to_log '  ++++ data.length=' + String(data.length)
  end

  loop += 1
  write_to_log '======================================'
end

write_to_log data.to_s

write_to_log metaTotal.to_s

$logFile.close()