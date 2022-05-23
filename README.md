## Binary search tree

A project with The Odin Project

## Assignment

You’ll build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values or check for an existing value before inserting.

[![wakatime](https://wakatime.com/badge/user/9450441a-ff7b-4805-b841-897d35ef3820/project/8c48e42f-66d6-4541-aadd-478af9eff5d5.svg)](https://wakatime.com/badge/user/9450441a-ff7b-4805-b841-897d35ef3820/project/8c48e42f-66d6-4541-aadd-478af9eff5d5)

## Methods

| Method        | Description   |
| ------------- |:-------------|
| #build_tree(array)     | Method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of Node objects appropriately placed. The #build_tree method will return the level-0 root node |
| #insert(value)     | Accepts a value to insert in the tree      |
| #delete(value) | Accepts a value to delete from the tree      |
| #level_order_interate & #level_order_recursive | Method which accepts a block. This method should traverse the tree in breadth-first level order and yield each node to the provided block return an array of level order values. This was done with iteration and recursion     |
| #inorder, #preorder & #postorder | Each method should traverse the tree in their respective depth-first order and yield each node to the provided block, return an array of values if no block is given     |
| #height(node) | Height method which accepts a node and returns its height    |
| #depth(node) | Depth method which accepts a node and returns its depth    |
| #balanced? | Method which checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1     |
| #find(value) | Returns the node of the node containing value, or nil if not found.    |
| #pretty_print | Use this method to visualize the tree, root in the left and leaf nodes to the right    |