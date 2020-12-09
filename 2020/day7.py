# Cheat
# keywords: recursion, strip from right of string, string not in

nesting_rules = {}

with open('day7.tst') as f:
  for line in f:
    b, a = line.strip('\n.').split('contain')
    print("b:", b, "a:", a)
    outer = b.rstrip('bags ')
    inners = [b.strip("bags ").split(' ', 1) for b in a.split(',') if not 'no' in b]

    nesting_rules[outer] = inners

print("nesting_rules:", nesting_rules)

# part 1
def can_contain_shiny_gold(bag_colour):
    if 'shiny gold' in bag_colour:
        return True
    else:
        return any(can_contain_shiny_gold(color) for _, color in nesting_rules[bag_colour])

def number_of_bags_contained(bag_color):
    if not nesting_rules[bag_color]:
        return 0
    else:
        return sum(int(num) + int(num) * number_of_bags_contained(color) for num, color in nesting_rules[bag_color])


print(sum(can_contain_shiny_gold(color) for color in nesting_rules.keys() if color != 'shiny gold'))
print(number_of_bags_contained('shiny gold'))
