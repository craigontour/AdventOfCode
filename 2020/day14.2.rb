# keywords: left padding, binary conversion, 

require 'Benchmark'

mask = ''
@mem = {} #Array.new(65536, 0)
@debug = false

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
  return ad
end

def subX(str, ch)
  return str.sub('X', ch)
end

def f(a, v)
  if (a =~ /X/).nil?
    @mem[a.to_i(2)] ||= []
    @mem[a.to_i(2)] = v
    puts " write mem[#{a.to_i(2)}] = #{v}" if @debug
  else
    repl = a.enum_for(:scan, /X/).map {Regexp.last_match.begin(0) }[0]

    f(subX(a, '0'), v)
    f(subX(a, '1'), v)
  end
  return a
end

start = Benchmark.measure {

  input = File.readlines('day14.txt')
  input.each do |line|
    line.chomp!
    l, r = line.split(' = ')
    ad = ''

    if l == 'mask'
      mask = r
      puts "mask : #{mask}" if @debug
    else
      addr = l.match('mem\[(\d+)\]').captures[0].to_i.to_s(2).rjust(36, '0')
      addr = applyMask2(mask, addr)
      value = r.to_i

      # addr = '1XX'
      f(addr, value)
    end
  end

  puts "Part 2:"
  pp @mem.inject(0) { |sum, value| sum += value[1] }
  # puts "Part 2: #{@mem.reduce(&:+)}"
  # @mem.each_with_index { |m, i| puts "m: #{m}, i: #{i}" if m != 0 }
}
puts "Part 2 benchmark: #{start.real}"
