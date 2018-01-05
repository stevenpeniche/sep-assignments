require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
	attr_reader :load_factor
	attr_reader :items

  def initialize(size)
    @max_load_factor = 0.7
		@items = Array.new(size) { LinkedList.new }
		@values_count = 0.0
  end

  def []=(key, value)
		new_node = Node.new(key, value)
		i = index(key, size)
		if ((@values_count + 1) / size) > @max_load_factor
			resize
		end
		@items[i].add_to_tail(new_node)
		@values_count+=1
  end

  def [](key)
		i = index(key, size)
		search = @items[i].find(key)
		search != nil ? search.value : -1
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
		key.sum % size
  end

  # Calculate the current load factor
  def load_factor
		(@values_count / size)
  end

  # Simple method to return the number of items in the hash
  def size
		@items.length
  end

  # Resize the hash
  def resize
		new_size = size * 2
		new_array = Array.new(new_size) { LinkedList.new }
		@items.each do |list|
			if list.head != nil
				current = list.head
				while current.next != nil
					current_next = current.next
					current.next = nil
					key = current.key
					new_array[index(current.key, new_size)].add_to_tail(current)
					current = current_next
				end
				new_array[index(current.key, new_size)].add_to_tail(current)
			end
		end
		@items = new_array
  end
end
