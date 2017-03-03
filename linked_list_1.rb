class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list)
  new_list = nil

  while list
    value = list.value
    new_list = LinkedListNode.new(value, new_list)
    list = list.next_node
  end
  return new_list
end

list = LinkedListNode.new(37)
list = LinkedListNode.new(99, list)
list = LinkedListNode.new(12, list)

print_values(list)
puts "-------"
revlist = reverse_list(list)
print_values(revlist)
