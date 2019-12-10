input = File.read('Day3_input.txt').split('')

x = 0
y = 0

a = {[0,0] => 1}

input.each { |i| 
    case i
        when '>'
            x += 1
        when '<'
            x -= 1
        when '^'
            y -= 1
        when 'v'
            y += 1
    end
    a[[x,y]] = 1
}

p a.length
