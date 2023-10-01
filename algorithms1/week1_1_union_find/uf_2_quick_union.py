# Lazy approach
# Initialize: O(n)
# Union: O(n)
# Find: O(n)
# Defect: trees can get tall.

class UnionFind:
    def __init__(self, n):
        self.ids = list(range(0, n))

    def root(self, i):
        while i != self.ids[i]:
            i = self.ids[i]
        return i

    def union(self, p, q):
        self.ids[self.root(p)] = self.root(q)

    def connected(self, p, q):
        return self.root(p) == self.root(q)
