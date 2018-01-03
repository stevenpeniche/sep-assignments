class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
		i = index(key, size)
		while @items[i] != nil && @items[i][1] != value
			resize
		end
		@items[i] = [key, value]
  end

  def [](key)
		i = index(key, size)
		@items[i][1]
  end

  def resize
		new_size = size * 2
		new_array = Array.new(new_size)
		@items.each do |item|
			if item != nil
				key = item[0]
				new_array[index(key, new_size)] = item
			end
		end
		@items = new_array
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
		key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
		@items.length
  end

end
