function throw_dice(throws_number)
  throw_sequence = Int64[]
  for i ∈ 1:throws_number
    throw = rand(1:6)
    push!(throw_sequence, throw)
  end
  return throw_sequence 
end

function main()
  # Obtener un 12 con dos dados, y 10 tiros
  throws_number = 10
  attempts_number = 10000
  throws = []
  one_counter = 0
  # The more population tests, the more accurate the simulation is
  for i ∈ 1:attempts_number
    throw_sequence = throw_dice(throws_number)
    second_throw_sequence = throw_dice(throws_number)
    append!(throw_sequence, second_throw_sequence)
    push!(throws, throw_sequence)
    # Counts if a 1 is found in the sequence
    #one_counter += any(x -> x == 1, throw_sequence) ? 1 : 0
    if 1 ∉ throw_sequence
      one_counter += 1
    end
  end
  println("Number of one's found: $one_counter - Number of attempts: $attempts_number")
  probability = one_counter/attempts_number
  println("Probability of not getting a one: $probability")
end

main()
