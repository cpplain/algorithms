# 215. Kth Largest Element in an Array
# Quick sort


class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        k = len(nums) - k
        return self.selectSort(nums, k, 0, len(nums) - 1)

    def selectSort(self, nums, k, s, e):
        left = s
        for i in range(s, e):
            if nums[i] < nums[e]:
                nums[left], nums[i] = nums[i], nums[left]
                left += 1
        nums[left], nums[e] = nums[e], nums[left]
        if k < left:
            return self.selectSort(nums, k, s, left - 1)
        if k > left:
            return self.selectSort(nums, k, left + 1, e)
        return nums[k]
