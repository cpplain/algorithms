def collatz(n)
  sequence = [n]
  i = 0

  while n > 1
    sequence << sequence[i] / 2 if sequence[i].even?
    sequence << 3 * sequence[i] + 1 if sequence[i].odd?
    i += 1
    n = sequence[i]
  end

  sequence
end

def longest_collatz(n1, n2)
  longest = [0, 0]

  (n1..n2).each do |i|
    longest = [i, collatz(i).length] if collatz(i).length > longest[1]
  end

  longest[0]
end

p collatz(7)
p longest_collatz(1, 1_000_000)
