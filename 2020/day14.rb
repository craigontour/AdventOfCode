# keywords: left padding, binary conversion, 

mem = [] #Array.new(65536, 0)

def applyMask(m, v)
  (0..35).each do |i|
    if m[i] != 'X'
      v[i] = m[i]
    end
  end
  return v
end

# mask = ''
# input = File.readlines('day14.tst1')

# input.each do |line|
#   line.chomp!
#   l, r = line.split(' = ')

#   if l == 'mask'
#     mask = r
#   else
#     reg = l.match('mem\[(\d+)\]').captures[0].to_i
#     value = r.to_i.to_s(2).rjust(36, '0')
#     mem[reg] = applyMask(mask, value).to_i(2)
#   end
# end
# puts "Part 1: #{mem.reduce(&:+)}"

mask = ''
@mem = Array.new(65536, 0)

def applyMask2(mask, addr)
  ad = ''
  (0..35).each do |i|
    case mask[i]
    when '0'
      ad += addr[i]
    when '1'
      ad += '1'
    when 'X'
      ad += 'X'
    end
  end
  #xs.sort! #.insert(0, 0) # .push(xs.reduce(:+))
  return ad
end

def changeX(addr, value)
  indices = []
  addr.chars.each_with_index { |c, i| indices << i if c == 'X' }
  # puts indices
  if indices.length > 0
    indices.each do |x|
      if addr[x] == 'X'
        # puts " x: #{x}, changeX: #{addr[0..(x-1)]}0#{addr[(x+1)..(addr.length-1)]}"
        changeX("#{addr[0..(x-1)]}0#{addr[(x+1)..(addr.length-1)]}", value)
        # puts " x: #{x}, changeX: #{addr[0..(x-1)]}1#{addr[(x+1)..(addr.length-1)]}"
        changeX("#{addr[0..(x-1)]}1#{addr[(x+1)..(addr.length-1)]}", value)
      end
    end
  else
    # puts "addr: #{addr}, write to mem #{addr.to_i(2)}, value: #{value}"
    @mem[addr.to_i(2)] = value
  end
end

def f(a, v)
  # puts "counter: #{counter} | a: #{a}" if@debug
  # readline() if@debug

  if a.count('X') == 0
    return a
  else
    for i in (a.length-1).downto(0) do
      puts "i: #{i} = #{a[i]}" if @debug

      if a[i] == 'X'
        puts "In #{a} replace X at #{i} with '0' and repeat" if @debug
        a[i] = '0'
        f(a, v)
        @mem[a.to_i(2)] = v

        puts "In #{a} replace X at #{i} with '1' and repeat" if @debug
        a[i] = '1'
        f(a, v)
        @mem[a.to_i(2)] = v
      end
    end
  end
  puts "write mem[#{a.to_i(2)}] = #{v}" if@debug
  puts "" if@debug
end

@debug = false

input = File.readlines('day14.tst2')
input.each do |line|
  line.chomp!
  l, r = line.split(' = ')
  ad = ''

  if l == 'mask'
    mask = r
    # puts "mask : #{mask}" if@debug
  else
    addr = l.match('mem\[(\d+)\]').captures[0].to_i.to_s(2).rjust(36, '0')
    addr = applyMask2(mask, addr)
    value = r.to_i

    # addr = 'XX'
    f(addr, value)
    # exit()
  end
end

@mem.each_with_index { |m, i| puts "m: #{m}, i: #{i}" if m != 0 }
puts "Part 2: #{@mem.reduce(&:+)}"
