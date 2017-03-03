class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list)
  if list
    print "#{list.value} --> "
    print_values(list.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list, new_next = nil)
  old_next = list.next_node
  list.next_node = new_next
  return reverse_list(old_next, list) if old_next
  list
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)
