class Node
  attr_accessor :data, :next

  def initialize(_data)
    @data = _data
    @next = nil
  end
end

class LinkedList
  def initialize(data)
    @head = Node.new(data)
  end

  def append(data)
    curr = @head

    until curr.next == nil
      curr = curr.next
    end

    curr.next = Node.new(data)
  end

  def prepend(data)
    node = Node.new(data)

    node.next = @head
    @head = node
  end

  def insert_after(prev_data, new_data)
    curr = @head

    until curr.data == prev_data
      curr = curr.next
    end

    node = Node.new(new_data)
    node.next = curr.next
    curr.next = node
  end

  def delete(data)
    curr = @head

    until curr.next.data == data
      curr = curr.next
    end

    temp = curr.next.next # Our node to delete's next pointer
    curr.next = temp
  end

  def length()
    curr = @head

    length = 1
    until curr.next == nil
      length += 1
      curr = curr.next
    end

    length
  end

  # nil <- 1 -> 2 -> 3 -> 4 -> nil
  #                       p    c
  def reverse()
    prev = nil
    curr = @head


    until curr == nil
      next_node = curr.next
      curr.next = prev

      prev = curr
      curr = next_node
    end

    @head = prev
  end

  def display()
    curr = @head

    until curr == nil
      print curr.data.to_s + " -> "

      curr = curr.next
    end

    puts
  end
end

linked_list = LinkedList.new(2)
linked_list.display()


linked_list.append(5)
linked_list.display()


linked_list.prepend(10)
linked_list.display()


linked_list.insert_after(10, 77)
linked_list.display()


linked_list.delete(77)
linked_list.display

linked_list.reverse
linked_list.display