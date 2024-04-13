# 1046. Last Stone Weight

import heapq


class Solution:
    def lastStoneWeight(self, stones: List[int]) -> int:
        stones = [-s for s in stones]
        heapq.heapify(stones)

        while len(stones) > 1:
            first = abs(heapq.heappop(stones))
            second = abs(heapq.heappop(stones))

            if first > second:
                heapq.heappush(stones, second - first)

        if not stones:
            return 0

        return abs(stones[0])
