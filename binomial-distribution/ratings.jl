# How to read a rating

#=
Suppose you have three different sellers, and you have to choose between them,
what you do is take the number of reviews (n) and add 2 more fictional reviews, one positive, and one negative (simulating the results of your experience).
=#

function ratingValues(n_reviews, positives)
	println("A seller with $n_reviews reviews, where $positives are positive")
	negatives = n_reviews - positives
	rating = round(positives/n_reviews * 100; digits= 2)
	println("This seller has a rating of $rating")
	positives += 1
	negatives += 1
	total_reviews = positives + negatives
	rating = round(positives/total_reviews * 100; digits= 2)
	println("After the possible purchase, our experience may vary, the final rating is $rating")
	
end

# Sellers
total_reviews = 10
# reviews
positive = 10
negative = 0

rating = positive/total_reviews * 100
println("First seller with $total_reviews reviews, having $positive positive and $negative negative")
println("Actual Rating : $rating %")

# Add the two fictional reviews
positive += 1
negative += 1
total_reviews = positive + negative
rating = round(positive/total_reviews * 100; digits= 3)
println("Now we have $positive positive and $negative negative and a final rating of $rating %")
println("With this rating is how our experience may be")

println("Having other companies like this one with different reviews: ")

ratingValues(50, 48)
ratingValues(200,186)
