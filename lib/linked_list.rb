require 'pry'
class LinkedList
  attr_reader :head
  def initialize(head = nil)
    @head = head
  end

  def append(surname)
    if head.nil?
      @head = Node.new(surname)
    else
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(surname)
    end
    surname#return value for "hardy"
  end

  def count
    count = 0
    if @head
      count += 1
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node
        count += 1
      end
    # if head && head.next_node
    #   return 2
    # elsif head
    #   return 1
    # else
    #   return 0

    end
    count#return of the count which is 2 of now
  end

  def to_string
    family_list = ""
    if @head
      family_list += "The #{head.surname} family"
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node
        family_list += ", followed by the #{current_node.surname} family"
      end
    end
    family_list
  end
end
