require './lib/node'

class LinkedList

  attr_reader :head

  def initialize
    @head = nil
  end

  def tail
    current = @head
    until current.next_node.nil?
      current = current.next_node
    end
    current
  end

  def empty?
    @head == nil
  end

  def append(entry)
    current = @head
    new_tail = Node.new(entry)
    if empty?
      @head = new_tail
    else
      tail.next_node = new_tail
    end
    new_tail.data
  end

  def prepend(entry)
    new_head = Node.new(entry)
    new_head.next_node = @head
    @head = new_head
    new_head.data
  end

  def insert(index, entry)
    left_node = @head
    if index == 0
      prepend(entry)
    elsif index < count
      (index - 1).times do
        left_node = left_node.next_node
      end
      new_node = Node.new(entry)
      new_node.next_node = left_node.next_node
      left_node.next_node = new_node
    else
      "Index number specified is too big!"
    end
  end

  def includes?(entry)
    beats = to_string.split(" ")
    found = beats.find {|word| entry == word}
    found != nil
  end

  def find(index, number)
    beats = to_string.split(" ")
    result = beats.select do |sound|
      beats.index(sound) >= index && beats.index(sound) < (index + number)
    end
    result.join(" ")
  end

  def count
    count = 0
    current = @head
    until current == nil
      current = current.next_node
      count += 1
    end
    count
  end

  def pop
    current = @head
    if empty?
      nil
    elsif count == 1
      popped = current.data
      @head = nil
      popped
    else
      while current.next_node.next_node != nil
        current = current.next_node
      end
      popped = current.next_node.data
      current.next_node = nil
      popped
    end
  end

  def to_string
    current = @head
    beats = []
    while current != nil
      beats << current.data
      current = current.next_node
    end
    beats = beats.join(" ")
  end

end
