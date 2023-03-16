require_relative 'lib/tree'
require_relative 'lib/node'

# testing binary seach tree class

puts "\n\n1- Create a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })"
bst = Tree.new(Array.new(15) { rand(1..100) })
bst.pretty_print

puts "\n2- Confirm that the tree is balanced by calling #balanced?"
puts bst.balanced?

puts "\n3- Print out all elements in level, pre, post, and in order"
puts "\n* Level order traversal printing each node and than printing all nodes in an array"
p bst.level_order_interate

puts "\n* Same using recursion"
p bst.level_order_recursive

puts "\n* Inorder traversal"
p bst.inorder

puts "\n* Preorder traversal"
p bst.preorder
bst.pretty_print

puts "\n4- Unbalance the tree by adding several numbers > 100"
bst.insert(rand(100..150))
bst.insert(rand(100..150))
bst.insert(rand(100..150))
bst.insert(rand(100..150))
bst.insert(rand(100..150))
bst.insert(rand(100..150))
bst.pretty_print

puts "\n5- Confirm that the tree is unbalanced by calling #balanced?"
puts bst.balanced?

puts "\n6- Balance the tree by calling #rebalance"
bst.rebalance
bst.pretty_print

puts "\n7- Confirm that the tree is balanced by calling #balanced?"
puts bst.balanced?

puts "\n8- Print out all elements in level, pre, post, and in order"
puts "\n* Level order traversal printing each node and than printing all nodes in an array"
p bst.level_order_interate

puts "\n* Same using recursion"
p bst.level_order_recursive

puts "\n* Inorder traversal"
p bst.inorder

puts "\n* Preorder traversal"
p bst.preorder
bst.pretty_print

=begin
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
puts bst.depth(bst.find(7)) # 2
puts bst.depth(bst.find(12)) # 4
puts bst.depth(bst.find(6)) # 0

puts "\nCheck if tree is balanced"
p bst.balanced?
bst.pretty_print
bst.delete(12)
p bst.balanced?
bst.pretty_print

puts "\nRebalance array"
bst.insert(40)
bst.insert(50)
bst.insert(19)
bst.insert(9)
bst.insert(1)
bst.insert(3)
bst.rebalance
=end

puts 'Take the sum of all left leafs of the tree'
puts 'The tree: '
bst = Tree.new(Array.new(15) { rand(1..20) })
bst.pretty_print
# bst.inorder { |node| p node.data unless node.right || node.left }
p bst.sum_left_leafs