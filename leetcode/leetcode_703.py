# 703. Kth Largest Element in a Stream

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest(k, nums)
# param_1 = obj.add(val)

import heapq


class KthLargest:
    def __init__(self, k: int, nums: List[int]):
        self.minheap = nums
        self.k = k

        heapq.heapify(self.minheap)

        while len(self.minheap) > self.k:
            heapq.heappop(self.minheap)

    def add(self, val: int) -> int:
        heapq.heappush(self.minheap, val)

        if len(self.minheap) > self.k:
            heapq.heappop(self.minheap)

        return self.minheap[0]
