# 912. Sort an Array
# Quick Sort


class Solution:
    def sortArray(self, nums: List[int]) -> List[int]:
        self.sortHelper(nums, 0, len(nums) - 1)
        return nums

    def sortHelper(self, nums, s, e):
        if e - s + 1 <= 1:
            return
        left = s
        for i in range(s, e):
            if nums[i] < nums[e]:
                nums[left], nums[i] = nums[i], nums[left]
                left += 1
        nums[left], nums[e] = nums[e], nums[left]
        self.sortHelper(nums, s, left - 1)
        self.sortHelper(nums, left + 1, e)
