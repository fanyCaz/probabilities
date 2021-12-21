function mean(X)
  return sum(X) / length(X)
end

function variance(X)
  mean_x = mean(X)
  return sum( map(xi -> (xi - mean_x)^2,X) ) / length(X)
end

function standard_deviation(X)
  return sqrt(variance(X))
end

function main()
  values = rand(9:11,20)
  mu = mean(values)
  println(values)
  println("μ of values $mu ")
  var = variance(values)
  println("Variance of values $var")
  σ = standard_deviation(values)
  println("σ of values $σ")
end

main()
