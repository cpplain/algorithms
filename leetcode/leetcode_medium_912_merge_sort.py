# 912. Sort an Array


class Solution:
    def sortArray(self, nums: List[int]) -> List[int]:
        if len(nums) == 1:
            return nums

        mid = len(nums) // 2
        left = self.sortArray(nums[:mid])
        right = self.sortArray(nums[mid:])
        len_left = len(left)
        len_right = len(right)
        i, j, k = 0, 0, 0

        while i < len_left and j < len_right:
            if left[i] <= right[j]:
                nums[k] = left[i]
                i += 1
            else:
                nums[k] = right[j]
                j += 1
            k += 1

        if i < len_left:
            nums[k:] = left[i:]
        if j < len_right:
            nums[k:] = right[j:]

        return nums
