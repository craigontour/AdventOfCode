count = 100
cookiescores = []
test = false

def count_negs(lst)
  neg = 0
  lst.each do |num|
    if num < 0
      neg += 1
    end
  end
  neg
end

def score(property, teaspoons)
  score = 0
  property.each_with_index do |p, i|
    score += property[i] * teaspoons[i]
  end
  return score
  # (property[0] * teaspoons[0]) + (property[1] * teaspoons[1]) + (property[2] * teaspoons[2]) + (property[3] * teaspoons[3])
end

def getCalories(calories, teaspoons)
  calorieCount = 0
  calories.each_with_index do |c, i|
    calorieCount += calories[i] * teaspoons[i]
  end
  return calorieCount
end

def cookieScore(properties, teaspoons)
  scores = []
  properties.each do |property|
    scores << score(property, teaspoons)
  end
  return scores
end

if test
  properties = [
    [ -1, 2 ],
    [ -2, 3 ],
    [ 6, -2 ],
    [ 3, -1 ]
  ]
  calories =  [ 8, 3 ]

  (1..count).each do |butterscotch|
    (1..count).each do |cinnamon|
      next if butterscotch + cinnamon != count

      s = cookieScore(properties, [butterscotch, cinnamon])

      if count_negs(s) == 0 && getCalories(calories, [butterscotch, cinnamon]) == 500
        cookiescores << s.each.reduce(:*)
      end
    end
  end
else
  properties = [
    [ 2, 0, 0, 0 ],
    [ 0, 5, 0, -1 ],
    [ -2, -3, 5, 0 ],
    [ 0, 0, -1, 5 ]
  ]
  calories =  [ 3, 3, 8, 8 ]

  (1..count).each do |sprinkles|
    (1..count).each do |butterscotch|
      (1..count).each do |chocolate|
        (1..count).each do |candy|
          next if sprinkles + butterscotch + chocolate + candy != count

          s = cookieScore(properties, [sprinkles, butterscotch, chocolate, candy])
          if count_negs(s) == 0 && getCalories(calories, [sprinkles, butterscotch, chocolate, candy]) == 500
            cookiescores << s.each.reduce(:*)
          end
        end
      end
    end
  end
end

pp cookiescores
pp cookiescores.max
