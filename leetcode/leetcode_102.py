# 102. Binary Tree Level Order Traversal

from collections import deque


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        queue = deque([root])
        result = []

        while queue:
            values = []

            for _ in range(len(queue)):
                node = queue.popleft()

                if node:
                    values.append(node.val)
                    queue.append(node.left)
                    queue.append(node.right)

            if values:
                result.append(values)

        return result
