using CSV
using DataFrames

function min_max(data,column)
  max_value = maximum(data[:,column])
  min_value = minimum(data[:,column])
  norm = (data[:,column] * 2 .- min_value .- max_value) ./ ( max_value - min_value )
  return norm
end

function main()
  cars_df = CSV.read("vehicle_s.csv", DataFrame)
  norm = min_max(cars_df,"compactness")
  print(norm)
end

main()
