# Build a Node class. It should have an attribute for the data it stores as well as its left and right children.
# As a bonus, try including the Comparable module and compare nodes using their data attribute.
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def children
    if !@left.nil? && !@right.nil?
      [@left, @right]
    elsif !@left.nil?
      [@left]
    elsif !@right.nil?
      [@right]
    else
      []
    end
  end
end
