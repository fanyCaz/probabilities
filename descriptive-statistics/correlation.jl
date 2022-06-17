using Statistics
using Plots

include("normalize.jl")

function covariance(col1,col2)
  mean1 = mean(col1)
  mean2 = mean(col2)
  return (1/length(col1)-1) * sum( (col1 .- mean1) .* (col2 .- mean2) )
end

function coef_correlation(col1,col2)
  ρ = covariance(col1,col2)/ std(col1)*std(col2)
  return ρ
end

function main()
  image_df = read_data("iris.csv")
  correlation_matrix = Statistics.cor(Matrix(image_df))
  hm = heatmap(correlation_matrix) 
  png(hm,"correlation.png")
end

main()
