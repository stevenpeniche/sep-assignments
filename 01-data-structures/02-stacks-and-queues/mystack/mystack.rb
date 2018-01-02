class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
		@stack.push(item)
		self.top = @stack[-1]
  end

  def pop
		@stack[-2] ? self.top = @stack[-2] : self.top = nil
		@stack.pop
  end

  def empty?
		@stack.length < 1 ? true : false
  end
end
