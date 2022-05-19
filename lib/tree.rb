require_relative 'node'

# Build a Tree class which accepts an array when initialized.
# The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.
class Tree
  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(array)
    return if array.size < 2

    mid_array = array.size / 2
    root = Node.new(array[mid_array])
  end
end
