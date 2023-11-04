# 707. Design Linked List
# Doubly linked list


class ListNode:
    def __init__(self, val):
        self.val = val
        self.prev = None
        self.next = None


class MyLinkedList:
    def __init__(self):
        # Set haead and tail to dummy nodes
        self.head = ListNode(None)
        self.tail = ListNode(None)
        self.head.next = self.tail
        self.tail.prev = self.head

    def get(self, index: int) -> int:
        cur = self.head.next
        while cur != self.tail and index >= 0:
            if index == 0:
                return cur.val
            cur = cur.next
            index -= 1
        return -1

    def addAtHead(self, val: int) -> None:
        node = ListNode(val)
        node.next = self.head.next
        node.prev = self.head
        self.head.next.prev = node
        self.head.next = node

    def addAtTail(self, val: int) -> None:
        node = ListNode(val)
        node.next = self.tail
        node.prev = self.tail.prev
        self.tail.prev.next = node
        self.tail.prev = node

    def addAtIndex(self, index: int, val: int) -> None:
        node = ListNode(val)
        cur = self.head.next
        while cur and index >= 0:
            if index == 0:
                node.next = cur
                node.prev = cur.prev
                cur.prev.next = node
                cur.prev = node
            cur = cur.next
            index -= 1

    def deleteAtIndex(self, index: int) -> None:
        cur = self.head.next
        while cur != self.tail and index >= 0:
            if index == 0:
                cur.prev.next = cur.next
                cur.next.prev = cur.prev
            cur = cur.next
            index -= 1


# Your MyLinkedList object will be instantiated and called as such:
# obj = MyLinkedList()
# param_1 = obj.get(index)
# obj.addAtHead(val)
# obj.addAtTail(val)
# obj.addAtIndex(index,val)
# obj.deleteAtIndex(index)
