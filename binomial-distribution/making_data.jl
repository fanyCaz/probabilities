using StatsBase
using Plots

# Plots related

gr(size = (800,450))

# End Plots related

# Simulate the ratings of different customers
function customerRatings()
  # Ten different customers are a sample
  punctuations = rand(10)
  positives = 0
  negatives = 0
  for i ∈ punctuations
    if i < 0.95
      positives += 1
    end
  end
  return positives
end

# Get the experiences of diffentes scenarios
positives_per_sample = Int64[]
for i = 1:50
  push!(positives_per_sample, customerRatings() )
end

println(positives_per_sample)
println("How many of these samples achieve the 100% rating?")
number_perfect_rating = count(i-> i == 10, positives_per_sample)
number_samples = length(positives_per_sample)
percentage_perfect_rating = round(number_perfect_rating/number_samples * 100; digits=2)
println("$number_perfect_rating out of $number_samples have perfect score, this being the $percentage_perfect_rating %")

# Success rate
# Goal: Maximize the probability of a good experience
# If given a success rate, we can simulate probabilities of having different reviews
# The 'problem' with the success rate, is that it keeps changing over time.
# For now, let's keep the problem with success rate of 0.95
s = 0.95
println(positives_per_sample)
rating_scale = 1:10
ratings_distribution = Int64[]

for i ∈ rating_scale
  print("number:  $i ")
  push!(ratings_distribution, count(x-> x == i, positives_per_sample))
end

println("Distribucion")
println("$ratings_distribution . number samples $number_samples")
quantity_scale = convert(Vector{Int},1:10)
quantity_scale = 1:10
K = Int(round(1 + 3.322 * log(length(positives_per_sample))))
# fit data in histogram
h = fit(Histogram, ratings_distribution, nbins= 10)
# h.weights frequency
println("Edges $(h.edges) Weights $(h.weights)")

p_histogram = histogram(
                  positives_per_sample,
                  bins = :scott,
                  xlabel = "Probability",
                  ylabel = "Frequency",
                  title = "Probabilities of ratings distribution",
                  legend = false,
                  color = :dodgerblue
               )
savefig("Distribution.png")
#=
p_scatter = scatter(t,observations, title="scattered")
=#
