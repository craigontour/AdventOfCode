require 'Benchmark'

def rangeToArray(range)
  r = range.split('-').map(&:to_i)
  (r[0]..r[1]).to_a.each { |n| @tckt << n }
end

start = Benchmark.measure {

  @tckt = []
  type = 0
  your = []
  near = 0
  File.readlines('day16.txt').each do |line|  
    if line.chomp.length == 0
      type += 1
    end

    if type == 0
      # puts "#{type} line: #{line}"
      line.chomp.match("(.+):(.+)").captures[1].split(' or ').each { |r| rangeToArray(r) }
    elsif type == 1
      # puts "#{type} line: #{line}"
      if line.chomp =~ /(\d?,)+/
        your << line.chomp.split(',').map(&:to_i)
      end
    else
      # puts "#{type} line: #{line}"
      if line.chomp =~ /(\d?,)+/
        line.chomp.split(',').map(&:to_i).each do |n|
          near += n if !@tckt.include?(n)
        end
      end
    end
  end
  pp "Part 1: #{near}"
}
puts "Part 1 benchmark: #{start.real}"
