require_relative 'lib/tree'
require_relative 'lib/node'

# testing binary seach tree class

bst = Tree.new([1, 2, 3, 4, 5, 6, 7])
bst.pretty_print

bst = Tree.new([2, 5, 4, 3, 6, 7, 87, 7, 9])
bst.pretty_print

puts "\nFind a node in the tree"
puts bst.find(4)
puts bst.find(87)
puts bst.find(2) ? true : false

puts "\nInsert values in the tree"
bst.insert(8)
bst.insert(9)
bst.insert(10)
bst.insert(1)
bst.insert(11)
bst.insert(12)
bst.pretty_print

puts "\nDelete nodes from tree"
puts "\nDelete 3"
bst.delete(3)
bst.pretty_print
puts "\nDelete 1"
bst.delete(1)
bst.pretty_print
puts "\nDelete 9"
bst.delete(9)
bst.pretty_print

puts "\nLevel order traversal printing each node and than printing all nodes in an array"
bst.level_order_interate { |node| puts node.data }
p bst.level_order_interate

puts "\nSame using recursion"
bst.level_order_recursive { |node| puts node.data }
p bst.level_order_recursive

bst.pretty_print
puts "\nInorder traversal"
bst.inorder { |node| puts node.data }
p bst.inorder

bst.pretty_print
puts "\nPreorder traversal"
bst.preorder { |node| puts node.data }
p bst.preorder

bst.pretty_print
puts "\nPostorder traversal"
bst.postorder { |node| puts node.data }
p bst.postorder

puts "\nGet the height of a given node"
puts bst.height(bst.find(4)) # 1
puts bst.height(bst.find(10)) # 3
puts bst.height(bst.find(6)) # 4

puts "\nGet the depth of a given node"
puts bst.depth(bst.find(4)) # 1
puts bst.depth(bst.find(10)) # 3
puts bst.depth(bst.find(6)) # 4