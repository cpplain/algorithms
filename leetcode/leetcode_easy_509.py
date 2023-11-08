# 509. Fibonacci Number


class Solution:
    def fib(self, n: int) -> int:
        if n <= 1:
            return n
        fib_min_2 = 0
        fib_min_1 = 1
        for _ in range(n - 2):
            fibn = fib_min_1 + fib_min_2
            fib_min_2 = fib_min_1
            fib_min_1 = fibn
        return fib_min_1 + fib_min_2
