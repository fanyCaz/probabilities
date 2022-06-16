using CSV
using DataFrames
using Statistics
using Plots

# Numerical scaling
function min_max(data,column)
  max_value = maximum(data[:,column])
  min_value = minimum(data[:,column])
  norm = (data[:,column] * 2 .- min_value .- max_value) ./ ( max_value - min_value )
  return norm
end

function z_score(data,column)
  mean_x = mean(data[:,column])
  std_x  = std(data[:,column])
  return (data[:,column] .- mean_x) ./ std_x
end

function print_distribution(values)
  p_histogram = histogram(
                          values,
                          bins = :scott,
                          legend= false,
                          color = :dodgerblue
                         )
  savefig("Distribucion_sqrt.png")
end

function hip_tan(data,column,setting)
  return map(x-> tanh(x/setting),data[:,column])
end

function square_root_data(data,column)
  return map(x-> √(x), data[:,column])
end

# Categorical variables

function one_hot(data,column)
  uniques = unique(reduce(vcat,data[:,column]))
  return uniques .== permutedims(uniques)
end

function main()
  gr(size=(800,450))
  cars_df = CSV.read("vehicle_s.csv", DataFrame)
  norm = min_max(cars_df,"compactness")
  norm = z_score(cars_df,"compactness")
  norm = hip_tan(cars_df,"compactness",1000)
  norm = square_root_data(cars_df,"compactness")
  print_distribution(norm)
  image_df = CSV.read("segmentation_paper.csv", DataFrame)
  classes = one_hot(image_df,"LABEL")
  print(classes)
end

main()
