require 'spec_helper'

RSpec.describe BinaryTree, type: :model do
  describe 'btree_sort should work' do
    ten       = BinaryTree.new(10, nil, nil)
    fourteen  = BinaryTree.new(14, ten, nil)
    six       = BinaryTree.new(6, nil, nil)
    one       = BinaryTree.new(1, nil, nil)
    nine      = BinaryTree.new(9, nil, fourteen)
    four      = BinaryTree.new(4, one, six)
    seven     = BinaryTree.new(7, four, nine)

    expected = [1, 4, 6, 7, 9, 10, 14]

    it 'should order the array' do
      expect(btree_sort(seven)).to eq expected
    end
  end
end
