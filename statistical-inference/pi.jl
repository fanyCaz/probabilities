include("tools.jl")

function throw_needles(number_needles)
  inside_circle = 0

  for i in 1:number_needles
    x = rand() * rand(-1:1)
    y = rand() * rand(-1:1)
    distance_from_origin = sqrt(x^2 + y^2)
    if distance_from_origin <= 1
      inside_circle += 1
    end
  end

  return (4 * inside_circle) / number_needles
end

function stimation(number_needles, attempts)
  stimates = []
  for i in 1:attempts
    pi_stimation = throw_needles(number_needles)
    push!(stimates,pi_stimation)
  end

  mean_pi = mean(stimates)
  std_dev = standard_deviation(stimates)
  println("Mean $mean_pi , standard deviation $std_dev, number_needles $number_needles")
  return (mean_pi, std_dev)
end

function main()
  # si la hipotenusa es mayor que 1 está fuera del círculo
  number_needles = 10000
  number_attempts = 100
  precis = 1
  sigma = precis
  # according to the normal distribution, 95% confidence
  while sigma >= precis / 1.96
    stats_pi = stimation(number_needles, number_attempts)
    number_needles *= 2
  end
end

main()
