def recursive_fib(n)
  return n if n.zero? || n == 1

  recursive_fib(n - 1) + recursive_fib(n - 2)
end

def iterative_fib(n)
  sequence = [0, 1]
  i = 2

  return sequence[n] if n.zero? || n == 1

  (n - 1).times do
    sequence << sequence[i - 1] + sequence[i - 2]
    i += 1
  end

  sequence[n]
end

# p recursive_fib(9)
# p iterative_fib(9)

require 'benchmark'
n = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(n) }
  x.report("iterative_fib") { iterative_fib(n) }
end
