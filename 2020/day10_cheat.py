
adaptors = [ 0, 1, 4, 5, 6, 7, 10, 11, 12, 15, 16, 19 ]

# Add a final joltage equal to the max of the current list + 3 (as specified by the question).
adaptors.append(adaptors[-1] + 3)
print(adaptors)

# Calculate a list store the differences between successive joltages.
diffs = [adaptors[i+1] - adaptors[i] for i in range(len(adaptors)-1)]
print(diffs)

# Part 1: Print the number of 1-jolt differences multiplied by the number of 3-jolt differences.
print("Part 1:",diffs.count(1) * diffs.count(3))

print("")

# Create a dictionary to store the number of possible routes "to each joltage".
routes = {}

# Initialise with 1 route to the starting joltage.
routes[0] = 1

# Begin iterating through adaptors (ignoring the first value because we already set it above).
for j in adaptors[1:]:
  # Each joltage route is equal to the sum of the number of routes to the previous three joltages.
  # However, some of the joltages won't be present in the list of adaptors.
  # So the number of routes to them will be 0.
  print("j:",j,"j-1:",routes.get(j-1), "j-2:", routes.get(j-2, 0), "j-3:",routes.get(j-3, 0))
  routes[j] = routes.get(j-1, 0) + routes.get(j-2, 0) + routes.get(j-3, 0)
  print("routes[j]",routes[j])
  print("")

# # Print the number of possible routes to get to the final adaptor.
print("Part 2:",routes[max(routes.keys())])