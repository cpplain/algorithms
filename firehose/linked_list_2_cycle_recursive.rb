class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
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

def cycle?(tortoise, hare=tortoise)
  @tortoise = tortoise
  @hare = hare
  if @hare.next_node.nil?
    return false
  else
    @hare = @hare.next_node
    return false if @hare.nil?
    @hare = @hare.next_node
    return false if @hare.nil?
    @tortoise = @tortoise.next_node
    return true if @tortoise == @hare
    cycle?(@tortoise, @hare)
  end
end

def cycle_len(list)
  len = 1
  cycle?(list)
  loop do
    @tortoise = @tortoise.next_node
    return len if @tortoise == @hare
    len += 1
  end
end

def cycle_start(list)
  cycle?(list)
  @tortoise = list
  loop do
    @tortoise = @tortoise.next_node
    @hare = @hare.next_node
    return @tortoise if @tortoise == @hare
  end
end

node1 = LinkedListNode.new(1)
node2 = LinkedListNode.new(2, node1)
node3 = LinkedListNode.new(3, node2)
node4 = LinkedListNode.new(4, node3)
node5 = LinkedListNode.new(5, node4)
node6 = LinkedListNode.new(6, node5)
node7 = LinkedListNode.new(7, node6)
node1.next_node = node5

p cycle?(node7)
p cycle_len(node7)
p cycle_start(node7)
