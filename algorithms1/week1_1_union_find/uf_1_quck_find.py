# Eager approach
# Initialize: O(n)
# Union: O(n)
# Find: O(1)
# Union is too expensive: takes n^2 array accesses to process a sequence of n
# union commands on n objects.

class UnionFind:
    def __init__(self, n):
        self.ids = list(range(0, n))

    def union(self, p, q):
        p_id = self.ids[p]
        q_id = self.ids[q]
        for i in range(len(self.ids)):
            if self.ids[i] == p_id:
                self.set[i] = q_id

    def connected(self, p, q):
        return self.ids[p] == self.ids[q]
