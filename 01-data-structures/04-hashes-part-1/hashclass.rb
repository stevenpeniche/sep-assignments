class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
		item = HashItem.new(key, value)
		i = index(key, size)

		while @items[i] != nil
      if @items[i].key != key || @items[i].value != value
        resize
      else
        break
      end
		end
		@items[i] = item
  end

  def [](key)
		i = index(key, size)
		if @items[i].key === key
			return @items[i].value
		else
			return -1 # If key/value pair doesn't exist
		end
  end

  def resize
		new_size = size * 2
		new_array = Array.new(new_size)
		@items.each do |item|
			if item != nil
				new_array[index(item.key, new_size)] = item
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
