using StatsBase

function createDeck(sticks, values)
  decks = []
  for stick in sticks
    for value in values
      push!(decks, (stick, value))
    end
  end
  return decks
end

function getHand(decks, hand_size)
  hand = rand(decks,hand_size)
  return hand
end

function main()
  sticks = ["sword","heart","rhombus","trefoil"]
  values = ["as","2","3","4","5","6","7","8","9","joker","queen","king"]
  attempts = 1000
  hand_size = 3
  decks = createDeck(sticks,values)
  hands = []
  for i in 1:attempts
    hand = getHand(decks, hand_size)
    push!(hands,hand)
  end
  count_pairs = 0
  for hand in hands
    vals = []
    for card in hand
      push!(vals, card[2])
    end
    counter = countmap(vals)
    for occurrence in counter
      if occurrence[2] == 3
        count_pairs += 1
        break
      end
    end
  end

  probability_pair = count_pairs / attempts
  println("Probability of getting a pair in a hand of $hand_size cards is $probability_pair")
end

main()
