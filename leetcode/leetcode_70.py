# 70. Climbing Stairs


class Solution:
    def climbStairs(self, n: int) -> int:
        if n <= 2:
            return n
        n_min_1 = 2
        n_min_2 = 1
        for _ in range(n - 3):
            next = n_min_1 + n_min_2
            n_min_2 = n_min_1
            n_min_1 = next
        return n_min_1 + n_min_2
