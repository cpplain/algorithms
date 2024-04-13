# 973. K Closest Points to Origin

import heapq


class Solution:
    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
        minheap = []

        for x, y in points:
            dist = (x**2) + (y**2)
            minheap.append([dist, x, y])

        heapq.heapify(minheap)

        result = []

        while len(result) < k:
            _, x, y = heapq.heappop(minheap)
            result.append([x, y])

        return result
