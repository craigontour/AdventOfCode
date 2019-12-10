
class Animal
    attr_accessor :name, :colour

    def initialize(name, colour)
        @name = name
        @colour = colour
    end

    def speak
        puts 'Hi'
    end

    def changename
        @name = 'john'
    end

    def to_s
        puts @name
    end
end

p1 = Animal.new('fred', 1)
p1.to_s
p1.changename
p1.to_s

class BFSList
    attr_accessor :node, :parent
    # @steps = 0

    def initialize(n, p)
        @n = n
        @p = p
        puts "#{node} #{parent}"
    end
end

queue = BFSList.new('1', '2')

pp p1

pp queue
