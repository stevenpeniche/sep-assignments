require_relative 'node'

class OpenAddressing
  def initialize(size)
		@items = Array.new(size)
  end

	def []=(key, value)
    node = Node.new(key, value)
    i = index(key, size)

    if @items[i] === nil
      @items[i] = node
    elsif @items[i].key != key
      resize
      self[key] = value
    elsif (@items[i].key === key) && (@items[i].value != value)
      if next_open_index(i) === -1
        resize
        @items[i] = value
      elsif next_open_index(i) != -1
        @items[i] = value
      end
    end
  end

  def [](key)
		i = index(key, size)
		@items[i].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
		key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
		i = index + 1
		while i < @items.length
			if @items[i] === nil
				return i
			else
				i+=1
			end
		end
		-1
  end

  # Simple method to return the number of items in the hash
  def size
		@items.length
  end

  # Resize the hash
  def resize
		new_size = size * 2
 		new_array = Array.new(new_size)
 		@items.each do |item|
 			if item != nil
 				key = item.key
 				new_array[index(key, new_size)] = item
 			end
 		end
 		@items = new_array
  end
end
