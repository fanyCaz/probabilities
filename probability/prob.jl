function throw_dice(throws_number)
  throw_sequence = Int64[]
  for i ∈ 1:throws_number
    println(i)
    throw = rand(1:6)
    push!(throw_sequence, throw)
  end
  return throw_sequence 
end

function main()
  throws_number = 1
  attempts_number = 100
  # The more population tests, the more accurate the simulation is
  throws = []
  for i ∈ 1:attempts_number
    throw_sequence = throw_dice(throws_number)
    push!(throws, throw_sequence)
  end
  println("Throws: ")
  println(throws)
  println("Throws with a 1")
  throws_with_one = 0
  for sequence ∈ throws
    throws_with_one += count(x -> x == 1, sequence)
  end
  println(throws_with_one)
  println("Probability a 1 is in a throw")
  probability = throws_with_one/attempts_number
  println(probability)
end

main()
