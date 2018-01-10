require_relative 'node'

class BinarySearchTree
  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node > root
      right_child = root.right
      if right_child === nil
        node.parent = root
        root.right = node
      else # Check the right child
        insert(right_child, node)
      end
    else
      left_child = root.left
      if left_child === nil
        node.parent = root
        root.left = node
      else # Check the left child
        insert(left_child, node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if data != nil
      left_child = root.left
      right_child = root.right
      if root.title === data
        root
      elsif right_child != nil
        find(right_child, data)
      elsif left_child != nil
        find(left_child, data)
      end
    end
  end

  def delete(root, data)
    if data != nil
      if node = find(root, data) # Is found
        parent = node.parent
        if node.right === nil && node.left === nil # Has no children
          parent.right === node ? parent.right = nil : parent.left = nil # Delete
        else
          parent.right = node.right
        end
      end
    end
  end

  # Recursive Breadth First Search
  def printf(tree=[@root])
    for node in tree
      tree.push node.left if node.left
      tree.push node.right if node.right
    end

    tree.map{ |node| puts "#{node.title}: #{node.rating}" }
  end
end
