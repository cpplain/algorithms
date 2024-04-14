# 215. Kth Largest Element in an Array

import heapq


class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        maxheap = [-i for i in nums]
        heapq.heapify(maxheap)

        result = None

        for _ in range(k):
            result = heapq.heappop(maxheap)

        return -result
