# 39. Combination Sum


class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        result = []

        def bfs(i, subset, total):
            if i >= len(candidates) or total > target:
                return

            if total == target:
                result.append(subset.copy())
                return

            subset.append(candidates[i])
            bfs(i, subset, total + candidates[i])

            subset.pop()
            bfs(i + 1, subset, total)

        bfs(0, [], 0)

        return result
