#require './lib/node'
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
    
  end

  def prepend(surname)
    last_head = @head
    @head = Node.new(surname)
    @head.next_node = last_head

  end

  def insert(position, surname)
    current_node = @head

    current_position = 0
    while current_position < position -1
      current_position += 1
      current_node = current_node.next_node
    end

    previous_node = current_node
    next_in_list = current_node.next_node
    new_node = Node.new(surname)
    previous_node.next_node = new_node
    new_node.next_node = next_in_list
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

    end
    count
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

  def find(start, num_families)
    current_node = @head

    current_position = 0
    while current_position < start
      current_position += 1
      current_node = current_node.next_node
    end

    family_list = "The #{current_node.surname} family"
    (num_families-1).times do
      current_node = current_node.next_node
      family_list += ", followed by the #{current_node.surname} family"
    end
    family_list


  end

  def includes?(surname)
    current_node = @head
    while current_node.next_node
      if current_node.surname == surname
        return true

      else
        current_node = current_node.next_node
      end
    end
    if current_node.surname == surname
      true
    else
      false
    end
  end
   def pop
     current_node = @head
     list_length = count
     (list_length -2).times do

       current_node = current_node.next_node
     end
     last_node = current_node.next_node
     current_node.next_node = nil
     puts "The #{last_node.surname} has died of dysentery"
     last_node
   end

end
