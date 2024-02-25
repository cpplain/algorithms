# 374. Guess Number Higher or Lower

# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num: int) -> int:


class Solution:
    def guessNumber(self, n: int) -> int:
        low, high = 1, n

        while low <= high:
            num = (low + high) // 2
            res = guess(num)

            if res < 0:
                high = num - 1
            elif res > 0:
                low = num + 1
            else:
                return num
