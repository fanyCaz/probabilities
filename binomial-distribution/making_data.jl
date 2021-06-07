using Plots

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
percentage_perfect_rating = number_perfect_rating/number_samples * 100
println("$number_perfect_rating out of $number_samples have perfect score, this being the $percentage_perfect_rating %")

# Success rate
# If given a success rate, we can simulate probabilities of having different reviews
s = 0

#=
gr(size = (800,450))

p_line = plot(t,observations,xlabel = "time", ylabel= "observations")

p_scatter = scatter(t,observations, title="scattered")
=#
# savefig("plot.png")
