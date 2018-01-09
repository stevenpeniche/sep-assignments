require_relative 'node'

class MinBinaryHeap
  attr_reader :tree

  def initialize(root)
    @tree = [root]
  end

  def insert(node)
    @tree.push node
    heapify(@tree.length - 1)
  end

  def heapify(node_index)
    parent_index = (node_index / 2).floor

    if @tree[node_index].rating < @tree[parent_index].rating
      swap(node_index, parent_index)
      heapify(parent_index)
    end
  end

  def swap(from, to)
    temp = @tree[from]
    @tree[from] = @tree[to]
    @tree[to] = temp
  end

  def find(data)
    @tree.map { |node| return node if node.title === data }
    return -1
  end

  def delete(data)
    if @tree.reject! { |node| node.title === data }
      heapify(@tree.length - 1)
      p @tree
    else
      return -1
    end
  end

  def print_heap
    @tree.map{ |node| puts "#{node.title}: #{node.rating}" }
  end
end
