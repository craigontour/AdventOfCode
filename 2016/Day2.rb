require 'pp'

input = File.readlines('Day2_input.txt')
# input = [ 'ULL','RRDDD','LURDL','UUUUD']

# # PART 1

# pad = [[1,2,3], [4,5,6], [7,8,9]]
# pos = [1,1]
# result = []

# for i in 0...input.length
#     line = input[i]
#     # pp line.length
#     for j in 0...line.length
#         # pp line[j]

#         if line[j] == "U" && pos[0] > 0
#             pos[0] -= 1
#         end
#         if line[j] == "D" && pos[0] < 2
#             pos[0] += 1
#         end
#         if line[j] == "L" && pos[1] > 0
#             pos[1] -= 1
#         end
#         if line[j] == "R" && pos[1] < 2
#             pos[1] += 1
#         end
#         puts "line[j] = #{line[j]}; pos = #{pos}"
#     end
#     result.push(pad[pos[0]][pos[1]])
# end

# pp result


# PART 2

pad = [[0,0,1,0,0], [0,2,3,4,0], [5,6,7,8,9], [0,"A","B","C",0], [0,0,"D",0,0]]
pos = [0,2]
pp pad[pos[1]][pos[0]]
result = []

for i in 0...input.length
    line = input[i]
    pp line
    for j in 0...line.length
        puts "line[j] = #{line[j]}; pos = #{pos}; pad(pos) = #{pad[pos[1]][pos[0]]}"

        if line[j] == "U" && pos[1] > 0 && (pad[pos[1]-1][pos[0]] != 0)
            pos[1] -= 1
        end
        if line[j] == "D" && pos[1] < 4 && (pad[pos[1]+1][pos[0]] != 0)
            pos[1] += 1
        end
        if line[j] == "L" && pos[0] > 0 && (pad[pos[1]][pos[0]-1] != 0)
            pos[0] -= 1
        end
        if line[j] == "R" && pos[0] < 4 && (pad[pos[1]][pos[0]+1] != 0)
            pos[0] += 1
        end
        puts "line[j] = #{line[j]}; pos = #{pos}"
    end
    result.push(pad[pos[1]][pos[0]])
end

pp result
