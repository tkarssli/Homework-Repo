require "byebug"
def fib(n)
return 1  if n == 1 || n== 2
  arr = []
  fib1 = fib(n-1)
  fib2 = fib(n-2)
  # debugger
  arr << (fib1 + fib2)

end
