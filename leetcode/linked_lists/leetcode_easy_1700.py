# 1700. Number of Students Unable to Eat Lunch

from collections import deque


class Solution:
    def countStudents(self, students: List[int], sandwiches: List[int]) -> int:
        studentq = deque(students)
        sandwichq = deque(sandwiches)
        requed = 0
        while studentq and sandwichq and requed < len(studentq):
            if studentq[0] == sandwichq[0]:
                studentq.popleft()
                sandwichq.popleft()
                requed = 0
            else:
                studentq.append(studentq.popleft())
                requed += 1
        return len(studentq)
