function recursive_fibonacci(n)
  if n == 0 || n == 1
    return 1
  end
  return recursive_fibonacci(n-1) + recursive_fibonacci(n-2)
end

function dynamic_fibonacci(n,memo=Dict())
  if n == 0 || n == 1
    return 1
  end

  try
    return memo[n]
  catch
    result = dynamic_fibonacci(n-1,memo) + dynamic_fibonacci(n-2,memo)
    memo[n] = result
    return result
  end
end

function read_number()
  println("Add a number to know its fibonacci result")
  number = readline(stdin)
  println( dynamic_fibonacci(parse(Int64,number)) )
end

read_number()
