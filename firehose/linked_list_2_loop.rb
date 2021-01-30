class LinkedList
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end

  # Print list values
  def print_values
    list = self
    while list
      print "#{list.value} --> "
      list = list.next_node
    end
    print "nil\n"
    return
  end

  # Reverse list by creating new list
  def reverse_create
    list = self
    new_list = nil
    while list
      value = list.value
      new_list = LinkedList.new(value, new_list)
      list = list.next_node
    end
    return new_list
  end

  # Reverse list by mutating current list
  def reverse_mutate
    list = self
    new_next = nil
    loop do
      old_next = list.next_node
      list.next_node = new_next
      return list if old_next.nil?
      new_next = list
      list = old_next
    end
  end

  # Detect if list contains a cycle
  def cycle?
    @tortoise = self
    @hare = self
    loop do
      @hare = @hare.next_node
      return false if @hare.nil?
      @hare = @hare.next_node
      return false if @hare.nil?
      @tortoise = @tortoise.next_node
      return true if @tortoise == @hare
    end
  end

  # Find cycle length
  def cycle_len
    len = 1
    self.cycle?
    loop do
      @tortoise = @tortoise.next_node
      return len if @tortoise == @hare
      len += 1
    end
  end

  # Find cycle start
  def cycle_start
    self.cycle?
    @tortoise = self
    loop do
      @tortoise = @tortoise.next_node
      @hare = @hare.next_node
      return @tortoise if @tortoise == @hare
    end
  end
end

node1 = LinkedList.new(37)
node2 = LinkedList.new(99, node1)
node3 = LinkedList.new(12, node2)

node3.print_values
puts "-------"
revlist = node3.reverse_create
revlist.print_values

puts

node1 = LinkedList.new(37)
node2 = LinkedList.new(99, node1)
node3 = LinkedList.new(12, node2)

node3.print_values
puts "-------"
revlist = node3.reverse_mutate
revlist.print_values

puts

node1 = LinkedList.new(1)
node2 = LinkedList.new(2, node1)
node3 = LinkedList.new(3, node2)
node4 = LinkedList.new(4, node3)
node5 = LinkedList.new(5, node4)
node6 = LinkedList.new(6, node5)
node7 = LinkedList.new(7, node6)
node1.next_node = node5

p node7.cycle?
p node7.cycle_len
p node7.cycle_start
