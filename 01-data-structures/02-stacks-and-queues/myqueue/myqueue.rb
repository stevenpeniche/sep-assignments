class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
		@tail = @queue[-1]
  end

  def enqueue(element)
		@queue[@queue.length] = element
		@head = @queue[0]
		@tail = @queue[-1]
  end

  def dequeue
		@queue.shift
		@head = @queue[0]
		@tail = @queue[-1]
  end

  def empty?
		@queue.length < 1
  end
end
