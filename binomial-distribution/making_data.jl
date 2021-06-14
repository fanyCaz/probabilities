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
for i = 1:10000
  push!(positives_per_sample, customerRatings() )
end

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
rating_scale = 1:10
ratings_distribution = Int64[]

println("Distribution")
for i ∈ rating_scale
  quantity = count(x-> x == i, positives_per_sample)
  println("Quantity of $i : $quantity")
end

# histogram( population, bins how is divided)
p_histogram = histogram(
                positives_per_sample,
                bins = :scott,
                xlabel = "Probability",
                ylabel = "Frequency",
                title = "Probabilities of ratings distribution",
                legend = false,
                color = :dodgerblue
              )

savefig("Distribution_$number_samples.png")

