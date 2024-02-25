# 75. Sort Colors


class Solution:
    def sortColors(self, nums: List[int]) -> None:
        bucket = [0, 0, 0]
        for n in nums:
            bucket[n] += 1
        i = 0
        for n in range(len(bucket)):
            for _ in range(bucket[n]):
                nums[i] = n
                i += 1
