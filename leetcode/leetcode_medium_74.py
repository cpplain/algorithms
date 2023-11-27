# 74. Search a 2D Matrix


class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        m_len, n_len = len(matrix), len(matrix[0])
        left, right = 0, m_len * n_len - 1

        while left <= right:
            mid = (left + right) // 2
            i, j = mid // n_len, mid % n_len

            if target < matrix[i][j]:
                right = mid - 1
            elif target > matrix[i][j]:
                left = mid + 1
            else:
                return True

        return False
