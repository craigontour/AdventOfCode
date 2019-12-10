# Day 15

# Part 1
# DISCS = [ [17, 15], [3, 2], [19, 4], [13, 2], [7, 2], [5, 0] ]

# Part 2
DISCS = [ [17, 15], [3, 2], [19, 4], [13, 2], [7, 2], [5, 0], [11, 0] ]
s = t = 0

def get_pos(d, t)
  (DISCS[d][1] + t) % DISCS[d][0]
  # puts "t #{t} | disc #{d} = #{p}"
  # return p
end

loop do
  # if success then s is time button was pressed
  s = t

  if get_pos(0, t+1) == 0
    if get_pos(1, t+2) == 0
      if get_pos(2, t+3) == 0
        if get_pos(3, t+4) == 0
          if get_pos(4, t+5) == 0
            if  get_pos(5, t+6) == 0
              if  get_pos(6, t+7) == 0
                puts "Part 1 = #{s}"
                exit
              end
            end
          end
        end
      end
    end  
  end

  # restart at the time button was pressed + 1
  t = s + 1
end

puts "Done!"