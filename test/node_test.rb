require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test


  def setup
    @node = Node.new("plop")
  end


  def test_it_exists
    assert_instance_of Node, @node
  end


  def test_node_contains_string_data
    assert_equal "plop", @node.data
  end


  def test_node_data_can_contain_different_string_data
    node = Node.new("boop")

    assert_equal "boop", node.data
  end


  def test_next_node_returns_nil_by_default
    assert_nil @node.next_node
  end


  def test_next_node_can_be_change_from_nil
    @node.next_node = "boop"

    assert_equal "boop", @node.next_node
  end

end
