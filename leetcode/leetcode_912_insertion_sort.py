# 912. Sort an Array


class Solution:
    def sortArray(self, nums: List[int]) -> List[int]:
        for i in range(len(nums)):
            j = i - 1
            while j >= 0 and nums[j] > nums[j + 1]:
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                j -= 1
        return nums
