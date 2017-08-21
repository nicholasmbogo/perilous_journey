require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/linked_list'
require_relative '../lib/node'

class LinkedListTest < Minitest::Test
  def test_head_is_nil_by_default
    linked_list = LinkedList.new
    assert_instance_of LinkedList, linked_list
    assert_nil linked_list.head
  end

  def test_it_can_append_the_first_node
    linked_list = LinkedList.new
    linked_list.append "West"
    assert_instance_of Node, linked_list.head#the head of the linked list should be a Node.
    assert_equal "West", linked_list.head.surname
  end

  def test_count_is_zero_without_head
    linked_list = LinkedList.new
    assert_equal 0, linked_list.count
  end

  def test_count_is_one_with_only_head
    linked_list = LinkedList.new
    linked_list.append "head"
    assert_equal 1, linked_list.count
  end

  def test_to_string_return_families
    linked_list = LinkedList.new
    linked_list.append "West"
    assert_equal "The West family", linked_list.to_string
  end

  def test_it_can_add_a_second_family_to_list
    linked_list = LinkedList.new
    linked_list.append "Rhodes"
    result = linked_list.append "Hardy"
    assert_equal "Hardy", result
    assert_instance_of Node, linked_list.head.next_node
    assert_equal 2, linked_list.count
  end

  def test_it_can_add_a_third_family_to_list
    linked_list = LinkedList.new
    linked_list.append "Rhodes"
    result = linked_list.append "Hardy"
    linked_list.append "cody"
    #assert_equal "Hardy", result
    assert_instance_of Node, linked_list.head.next_node.next_node
    #assert_equal 2, linked_list.count
    assert_equal 3, linked_list.count
end
    def test_to_string_return_multiple_families
      linked_list = LinkedList.new
      linked_list.append "Hardy"
      linked_list.append "cody"
      assert_equal "The Hardy family, followed by the cody family", linked_list.to_string
    end
end
