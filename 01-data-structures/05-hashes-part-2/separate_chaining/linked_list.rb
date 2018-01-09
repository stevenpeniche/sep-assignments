require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

	def initialize
		self.head = nil
		self.tail = nil
	end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
		if self.head != nil
			current = self.head
			while current.next != nil
				current = current.next
			end
			current.next = node
			self.tail = node
		else
			self.head = node
			self.tail = node
		end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
		if self.head != nil && self.head.next != nil
			previous = nil
			current = self.head
			while current.next != nil
				previous = current
				current = current.next
			end
			previous.next = nil
			self.tail = previous
		else
			self.tail = nil
		end
  end

  # This method prints out a representation of the list.
  def print
		list_head = self.head
		next_node = list_head.next
		puts list_head.data
		while next_node
			puts next_node.data
			next_node = next_node.next unless next_node.next === false
		end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
		current = self.head
		if current == node
			self.head = current.next
			return
		else
			while current.next != nil && current.next != node
				current = current.next
			end
			current.next = current.next.next
			while current.next != nil
				current = current.next
			end
			self.tail = current
		end
  end

	# This method finds `node` from the list or returns `-1` if it doesn't exist
	def find(key)
		current = self.head
		if current.key == key
			return current
		else
			while current.next != nil && current.next.key != key
				current = current.next
			end
			return current.next
		end
	end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
		node.next = self.head.next
		self.head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
		self.head = self.head.next
  end
end
