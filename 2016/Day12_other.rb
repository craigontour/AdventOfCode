# From https://www.reddit.com/r/adventofcode/comments/5hus40/2016_day_12_solutions/

# Use @ - how does that work?

file = File.new("Day12_input.txt","r")
lines = []
while (line=file.gets)
	lines << line.split(' ')
end

i=0

@a = @b = @d = 0
@c = 0 # Part 1/2

def get(var)
	out = 0
	case var
	when "a"
		out = @a
	when "b"
		out = @b
	when "c"
		out = @c
	when "d"
		out = @d
	else
		out = var.to_i
	end
	return out
end

def set(var,val)
	case var
	when "a"
		@a = val
	when "b"
		@b = val
	when "c"
		@c = val
	when "d"
		@d = val
	end
end

while (i<lines.length and i>-1)
	jumped=false
	case lines[i][0]
	when "cpy"
		set(lines[i][2],get(lines[i][1]))
	when "inc"
		set(lines[i][1],get(lines[i][1])+1)
	when "dec"
		set(lines[i][1],get(lines[i][1])-1)
	when "jnz"
		val = get(lines[i][1])
		if val!=0 then
			jumped=true
			i+=lines[i][2].to_i
		end
	end
	if !jumped then
		i+=1
	end
end
puts @a
