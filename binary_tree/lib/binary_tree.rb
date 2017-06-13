class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end
end

def btree_sort(node)
  node_stack = [node]
  sorted_stack = []

  loop do
    return sorted_stack.map!(&:payload) if node_stack.empty?

    current_node = node_stack.pop

    if current_node.left && !sorted_stack.include?(current_node.left)
      node_stack.push(current_node).push(current_node.left)
    elsif current_node.right && !sorted_stack.include?(current_node.right)
      sorted_stack << current_node
      node_stack.push(current_node).push(current_node.right)
    elsif !sorted_stack.include?(current_node)
      sorted_stack << current_node
    end
  end
end

ten       = BinaryTree.new(10, nil, nil)
fourteen  = BinaryTree.new(14, ten, nil)
six       = BinaryTree.new(6, nil, nil)
one       = BinaryTree.new(1, nil, nil)
nine      = BinaryTree.new(9, nil, fourteen)
four      = BinaryTree.new(4, one, six)
seven     = BinaryTree.new(7, four, nine)

p btree_sort(seven)
