require 'pp'

trans = {
  'AND'    => '&',
  'OR'     => '|',
  'NOT'    => '~',
  'LSHIFT' => '<<',
  'RSHIFT' => '>>'
}

p eval ARGF.
  read.
  gsub(Regexp.union(trans.keys), trans).
  gsub(/(.+?) -> (\w+)/) { "%2s = #$1" % $2 }.
  upcase.
  split("\n").
  # sort.
  # rotate.
  join(?;)

# Search for 0x0dea on https://www.reddit.com/r/adventofcode/comments/3vr4m4/day_7_solutions/