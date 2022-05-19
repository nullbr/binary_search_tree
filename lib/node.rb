# Build a Node class. It should have an attribute for the data it stores as well as its left and right children.
# As a bonus, try including the Comparable module and compare nodes using their data attribute.

class Node
  include Comparable

  def initialize(data, left_child, right_child); end
end
