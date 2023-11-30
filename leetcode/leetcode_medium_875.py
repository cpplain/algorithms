# 875. Koko Eating Bananas


class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        low, high = 1, max(piles)
        k = high

        while low <= high:
            mid = low + (high - low) // 2
            hours = 0
            for pile in piles:
                hours += -(-pile // mid)

            if hours <= h:
                high = mid - 1
                k = min(k, mid)
            else:
                low = mid + 1

        return k
