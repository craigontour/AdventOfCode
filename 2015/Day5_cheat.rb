# Day 5 2015

# solution in reddit megathread
# https://www.reddit.com/r/adventofcode/comments/3viazx/day_5_solutions/
input.inject(0) { |c,s|
 (s.scan(/ab|cd|pq|xy/).length == 0) &&
 (s.scan(/[aeiou]/).length > 2) &&
 (s.scan(/(.)\1/).length > 0) && c+=1; c
}
