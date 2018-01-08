class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :parent
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    @title = title
    @rating = rating
    @parent = nil
    @left = nil
    @right = nil
  end

  def >(node)
    self.rating > node.rating
  end

  def <(node)
    self.rating < node.rating
  end
end
