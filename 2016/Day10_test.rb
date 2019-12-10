require 'pp'
File.read('Day10_input.txt').each_line { |line|
    pp line.chomp.split(/\W/).join(',') + "
".chomp
    # for i in 0...items.length
    #   print items
    # end
}
