# 278. First Bad Version

# The isBadVersion API is already defined for you.
# def isBadVersion(version: int) -> bool:


class Solution:
    def firstBadVersion(self, n: int) -> int:
        low, high = 1, n
        while low <= high:
            mid = low + (high - low) // 2
            if mid - 1 > 0 and isBadVersion(mid) and isBadVersion(mid - 1):
                high = mid - 1
            elif not isBadVersion(mid):
                low = mid + 1
            else:
                return mid
