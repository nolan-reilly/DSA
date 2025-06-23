class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value  
    @left = nil
    @right = nil
  end
end

class BinaryTree
  
  def initialize(node = nil)
    @root = node
  end

  def insert(value)
    if @root.nil?
      @root = Node.new(value)
      return
    end

    current = @root

    loop do
      if value < current.value
        if current.left.nil?
          current.left = Node.new(value)
          return true
        else
          current = current.left
        end
      elsif value > current.value
        if current.right.nil?
          current.right = Node.new(value)
          return true
        else
          current = current.right
        end
      else
        return false # Don't allow duplicate values
      end
    end
  end

  def in_order(node = @root)
    return if node.nil?

    in_order(node.left)
    puts node.value
    in_order(node.right)
  end

  def pre_order(node = @root)
    return if node.nil?

    puts node.value
    pre_order(node.left)
    pre_order(node.right)
  end

  def post_order(node = @root)
    return if node.nil?

    post_order(node.left)
    post_order(node.right)
    puts node.value
  end

  def search(value, node = @root)
    return false if node.nil?
    return true if node.value == value

    if value < node.value
      search(value, node.left)
    else
      search(value, node.right)
    end
  end

  def height(node = @root)
    if node.nil?
      return 0
    end

    left_height = height(node.left)
    right_height = height(node.right)

    return 1 + [left_height, right_height].max

  end
end