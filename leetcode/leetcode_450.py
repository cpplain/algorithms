# 450. Delete Node in a BST

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def rightMinVal(self, root: Optional[TreeNode]) -> int:
        curr = root
        while curr and curr.left:
            curr = curr.left
        return curr.val

    def deleteNode(self, root: Optional[TreeNode], key: int) -> Optional[TreeNode]:
        if not root:
            return None

        if key < root.val:
            root.left = self.deleteNode(root.left, key)
        elif key > root.val:
            root.right = self.deleteNode(root.right, key)
        else:
            if not root.left:
                return root.right
            elif not root.right:
                return root.left
            else:
                minVal = self.rightMinVal(root.right)
                root.val = minVal
                root.right = self.deleteNode(root.right, minVal)

        return root
