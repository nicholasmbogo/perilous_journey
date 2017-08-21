#'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_has_a_surname
    node = Node.new("Burke")
    assert_equal "Burke", node.surname
  end

  def test_next_node_nil_by_default
    node = Node.new("Burke")
    assert_nil node.next_node
  end
end
