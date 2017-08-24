require 'pry'
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
    assert_instance_of Node, linked_list.head
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

    assert_equal "Hardy", result.surname
    assert_instance_of Node, linked_list.head.next_node
    assert_equal 2, linked_list.count
  end

  def test_it_can_add_a_third_family_to_list
    linked_list = LinkedList.new
    linked_list.append "Rhodes"
    result = linked_list.append "Hardy"
    linked_list.append "cody"

    assert_instance_of Node, linked_list.head.next_node.next_node

    assert_equal 3, linked_list.count
end
    def test_to_string_return_multiple_families
      linked_list = LinkedList.new
      linked_list.append "Hardy"
      linked_list.append "cody"

      assert_equal "The Hardy family, followed by the cody family", linked_list.to_string
    end

    def test_it_can_add_a_fourth_family_to_list
      linked_list = LinkedList.new
      linked_list.append "Hardy"
      linked_list.append "cody"
      linked_list.append ("Brooks")

      assert_equal "Brooks", linked_list.head.next_node.next_node.surname

      assert_equal "The Hardy family, followed by the cody family, followed by the Brooks family", linked_list.to_string
    end

    def test_it_can_prepend_a_family_name_to_the_linked_list
      linked_list = LinkedList.new
      linked_list.append "Hardy"
      linked_list.append "cody"

      assert_equal "The Hardy family, followed by the cody family", linked_list.to_string
      linked_list.prepend "McKinney"

            assert_equal "McKinney", linked_list.head.surname
      assert_equal "The McKinney family, followed by the Hardy family, followed by the cody family", linked_list.to_string
    end

    def test_it_can_insert_a_family_in_position_one_to_list
      linked_list = LinkedList.new
      linked_list.append "McKinny"
      linked_list.append "Hardy"
      linked_list.insert(1, "Lawson")

      assert_equal "Lawson", linked_list.head.next_node.surname

      assert_equal "The McKinny family, followed by the Lawson family, followed by the Hardy family", linked_list.to_string
    end

    def test_it_can_find_and_return_one_family
      linked_list = LinkedList.new
      linked_list.append "McKinny"
      linked_list.append "Hardy"
      linked_list.append "Lawson"
      
      assert_equal "The Hardy family", linked_list.find(1, 1)
    end

    def test_it_can_find_and_return_two_families
      linked_list = LinkedList.new
      linked_list.append "McKinny"
      linked_list.append "Hardy"
      linked_list.append "Lawson"
      linked_list.append "Henderson"

      assert_equal "The Hardy family, followed by the Lawson family, followed by the Henderson family", linked_list.find(1, 3)
    end

    def test_it_returns_true_when_list_includes_family
      linked_list = LinkedList.new
      linked_list.append "McKinny"
      linked_list.append "Hardy"
      linked_list.append "Lawson"
      linked_list.append "Henderson"

      assert_equal true, linked_list.includes?("Henderson")
    end

    def test_it_returns_true_when_list_includes_family
      linked_list = LinkedList.new
      linked_list.append "McKinny"
      linked_list.append "Hardy"
      linked_list.append "Lawson"
      linked_list.append "Henderson"

      assert_equal false, linked_list.includes?("chapman")
    end
    def test_it_pops_last_family
      linked_list = LinkedList.new
      linked_list.append "McKinny"
      linked_list.append "Hardy"
      linked_list.append "Lawson"
      linked_list.append "Henderson"
      popped = linked_list.pop

      assert_equal 3, linked_list.count
      assert_instance_of Node, popped
      assert_equal "Henderson", popped.surname
    end


  end
