@ship_x, @ship_y, @heading = 0, 0, 90

def instructions
  @instructions ||= File.open('day12.txt').readlines.map { |line| [line[0], line[1..].to_i] }
end

def manhattan
  @ship_x.abs + @ship_y.abs
end

def travel!
  instructions.each do |instruction, value|
    case instruction
    when "N" then move_on_y_axis(-value)
    when "S" then move_on_y_axis(value)
    when "W" then move_on_x_axis(-value)
    when "E" then move_on_x_axis(value)
    when "F" then forward(value)
    when "L" then rotate(-value)
    when "R" then rotate(value)
    end
  end
end

def move_on_y_axis(distance) @ship_y += distance end
def move_on_x_axis(distance) @ship_x += distance end

def forward(distance)
  case @heading
  when 0   then move_on_y_axis(-distance)
  when 90  then move_on_x_axis(distance)
  when 180 then move_on_y_axis(distance)
  when 270 then move_on_x_axis(-distance)
  end
end

def rotate(degrees)
  @heading = (@heading + degrees) % 360
end

travel!
p manhattan

# @ship_x, @ship_y = 0, 0
# @waypoint_x, @waypoint_y = 10, -1

# def move_on_y_axis(distance) @waypoint_y += distance end
# def move_on_x_axis(distance) @waypoint_x += distance end

# def forward(distance)
#   @ship_x += @waypoint_x * distance
#   @ship_y += @waypoint_y * distance
# end

# def rotate(degrees)
#   (degrees % 360 / 90).times do
#     @waypoint_x, @waypoint_y = @waypoint_y, @waypoint_x
#     @waypoint_x = -@waypoint_x
#   end
# end

# if __FILE__ == $0
#   travel!
#   p manhattan
# end