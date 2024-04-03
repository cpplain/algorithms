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
        if not root:
            return []

        queue = deque([[root]])
        result = [[root.val]]

        while queue:
            curr_level = queue.popleft()
            next_level = []
            values = []

            for node in curr_level:
                if node.left:
                    next_level.append(node.left)
                    values.append(node.left.val)
                if node.right:
                    next_level.append(node.right)
                    values.append(node.right.val)

            if next_level:
                queue.append(next_level)

            if values:
                result.append(values)

        return result
