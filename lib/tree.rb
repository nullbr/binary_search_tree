require_relative 'node'

# Build a Tree class which accepts an array when initialized.
# The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.
class Tree
  def initialize(array)
    @array = merge_sort(array)
    @root = build_tree(@array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # find a node, will help delete node
  def find(val, current_node = @root)
    return if current_node.nil?

    return current_node if current_node.data == val

    current_node.data < val ? find(val, current_node.right) : find(val, current_node.left)
  end

  # accepts a value to insert in the tree
  def insert(value, node = @root)
    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    elsif value > node.data
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
  end

  # accepts a value to delete from the tree
  def delete(value)
    val_node = find(value)
    return if val_node.nil?

    if val_node.children.size < 2
      delete_node_single_child(val_node)
    else
      delete_node_with_two_children(val_node)
    end
  end

  # level_order method which accepts a block.
  # This method should traverse the tree in breadth-first level order and yield each node to the provided block
  # return an array of level order values
  def level_order_interate(node = @root, queue = [])
    queue << node
    array = []

    until queue.empty?
      node = queue[0]
      block_given? ? (yield node) : array << node.data

      queue += node.children
      queue.shift
    end
    array unless array.empty?
  end

  def level_order_recursive(queue = [@root], array = [], &block)
    if queue.empty?
      array.empty? ? return : (return array)
    end

    node = queue[0]
    block_given? ? (yield node) : array << node.data
    queue += node.children
    queue.shift
    level_order_recursive(queue, array, &block)
  end

  # inorder, preorder, and postorder methods that accepts a block. 
  # Each method should traverse the tree in their respective depth-first order and yield each node to the provided block. 
  # The methods should return an array of values if no block is given.
  def inorder(node = @root, &block)
    return if node.nil?

    inorder(node.left, &block)
    yield node
    inorder(node.right, &block)
  end
  
  def preorder(node = @root, &block)
    return if node.nil?

    yield node
    preorder(node.left, &block)
    preorder(node.right, &block)
  end

  def postorder(node = @root, &block)
    return if node.nil?

    postorder(node.left, &block)
    postorder(node.right, &block)
    yield node
  end

  private

  def merge_sort(arr, result = [])
    return arr if arr.length < 2

    left_arr = merge_sort(arr.slice!(0..arr.length / 2 - 1), result)
    right_arr = merge_sort(arr, result)

    result = []

    until left_arr.empty? || right_arr.empty?
      if left_arr[0] == right_arr[0]
        left_arr.shift
      elsif left_arr[0] < right_arr[0]
        result << left_arr.shift
      else
        result << right_arr.shift
      end
    end

    result + left_arr + right_arr
  end

  def build_tree(array)
    return if array.empty?

    return Node.new(array[0]) if array.size == 1

    mid_array = array.size / 2
    root = Node.new(array[mid_array])

    root.left = build_tree(array[0..mid_array - 1])
    root.right = build_tree(array[mid_array + 1..array.size])

    root
  end

  def delete_node_single_child(val_node, node = @root)
    return if val_node.nil?

    if val_node.data < node.data
      node.left == val_node ? node.left = node.left.children[0] : delete_node_single_child(val_node, node.left)
    elsif val_node.data > node.data
      node.right == val_node ? node.right = node.right.children[0] : delete_node_single_child(val_node, node.right)
    end
  end

  def delete_node_with_two_children(node)
    successor = find_successor(node)
    delete_node_single_child(successor)
    node.data = successor.data
  end

  def find_successor(node, count = 0)
    return node if node.left.nil?

    if count.zero?
      find_successor(node.right, count + 1)
    else
      find_successor(node.left, count)
    end
  end
end
