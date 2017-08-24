require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/wagon_train'
require './lib/linked_list'
require './lib/node'

class WagonTrainTest < Minitest::Test
  def test_if_wagon_train_exists
    wagont = WagonTrain.new
    assert_instance_of WagonTrain, wagont
  end

  def test_wagon_train_has_link_list_by_default
    wagont = WagonTrain.new
    assert_instance_of LinkedList, wagont.list
  end

  def test_wagon_train_can_append_a_new_node_to_list
    wagont = WagonTrain.new
    node = wagont.append "Burke"
    assert_instance_of Node, node
  end
end
