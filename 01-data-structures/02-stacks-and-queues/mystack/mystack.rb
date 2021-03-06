class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
		@stack[@stack.length] = item
		self.top = @stack[-1]
  end

  def pop
		self.top = @stack[-2]
		@stack.slice!(-1)
  end

  def empty?
		@stack.length < 1
  end
end
