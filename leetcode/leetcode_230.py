# 230. Kth Smallest Element in a BST

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def inorderTraversal(self, root: Optional[TreeNode], k: int, nodes: List[int]):
        if not root:
            return

        self.inorderTraversal(root.left, k, nodes)

        nodes.append(root.val)
        if len(nodes) >= k:
            return

        self.inorderTraversal(root.right, k, nodes)

    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        nodes = []

        self.inorderTraversal(root, k, nodes)

        return nodes[k - 1]
