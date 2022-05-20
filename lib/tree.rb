require_relative 'node'

# Build a Tree class which accepts an array when initialized.
# The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.
class Tree
  def initialize(array)
    @array = merge_sort(array)
    @root = build_tree(@array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

  # find a node, will help delete node
  def find(val, current_node = @root)
    return if current_node.nil?

    return current_node if current_node.data == val

    current_node.data < val ? find(val, current_node.right_child) : find(val, current_node.left_child)
  end

  # accepts a value to insert in the tree
  def insert(value, node = @root)
    if value < node.data
      node.left_child.nil? ? node.left_child = Node.new(value) : insert(value, node.left_child)
    elsif value > node.data
      node.right_child.nil? ? node.right_child = Node.new(value) : insert(value, node.right_child)
    end
  end

  # accepts a value to delete from the tree
  def delete(value, node = @root)
    return if node.nil?

    if node.data == value
      if node.right_child.nil? && node.left_child.nil?
        node = nil
        nil
      elsif node.right_child.nil? || node.left_child.nil?
        node = node.right_child.nil? ? node.left_child : node.right_child
        nil
      end
    end
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

    root.left_child = build_tree(array[0..mid_array - 1])
    root.right_child = build_tree(array[mid_array + 1..array.size])

    root
  end
end
