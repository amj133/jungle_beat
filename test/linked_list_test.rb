require './lib/linked_list'
require './lib/node'
require 'minitest/autorun'
require 'minitest/pride'

class LinkedListTest < Minitest::Test


  def setup
    @list = LinkedList.new
  end


  def test_it_exists
    assert_instance_of LinkedList, @list
  end


  def test_it_starts_with_head_equal_nil
    assert_nil @list.head
  end


  def test_empty_returns_true_if_list_is_empty
    assert @list.empty?
  end


  def test_empty_returns_false_if_list_is_not_empty
    @list.append("doop")

    refute @list.empty?
  end


  def test_head_data_equals_new_node_when_empty_list_is_appended
    @list.append("doop")

    assert_equal "doop", @list.head.data
    assert_equal "doop", @list.tail.data
    assert_nil @list.head.next_node
  end


  def test_head_points_to_new_node_when_empy_list_appended
    @list.append("doop")
    @list.append("bleep")

    assert_equal "doop", @list.head.data
    assert_equal "bleep", @list.head.next_node.data
    assert_equal "bleep", @list.tail.data
    assert_nil @list.tail.next_node
  end


  def test_count_returns_number_of_nodes
    @list.append("doop")
    @list.append("bleep")
    @list.append("blop")

    assert_equal 3, @list.count

    @list.prepend("monkey")
    @list.insert(1, "gorilla")
    @list.pop

    assert_equal 4, @list.count
  end


  def test_to_string_returns_all_node_data_seperated_by_a_space
    @list.append("doop")
    @list.append("bleep")
    @list.append("blop")
    @list.prepend("monkey")
    @list.insert(1, "gorilla")

    assert_equal "monkey gorilla doop bleep blop", @list.to_string

    @list.pop

    assert_equal "monkey gorilla doop bleep", @list.to_string
  end


  def test_prepend_adds_new_node_to_head
    @list.append("doop")
    @list.append("bleep")
    @list.append("blop")
    @list.prepend("monkey")

    assert_equal "monkey", @list.head.data
    assert_equal "doop", @list.head.next_node.data
    assert_equal "blop", @list.tail.data
  end


  def test_insert_puts_new_node_in_correct_index
    @list.append("doop")
    @list.append("bleep")
    @list.append("blop")
    @list.insert(1, "monkey")
    @list.insert(3, "gorilla")

    assert_equal "monkey", @list.head.next_node.data
    assert_equal "gorilla",
      @list.head.next_node.next_node.next_node.data
  end


  def test_insert_puts_new_node_in_head_when_0_index_specified
    @list.append("doop")
    @list.append("bleep")
    @list.append("blop")
    @list.insert(0, "monkey")

    assert_equal "monkey", @list.head.data
    assert_equal "doop", @list.head.next_node.data
    assert_equal "blop", @list.tail.data
  end


  def test_insert_with_index_larger_than_node_count_returns_error
    @list.append("doop")
    @list.append("bleep")
    @list.append("blop")

    assert_equal "Index number specified is too big!",
      @list.insert(3, "monkey")
  end


  def test_find_returns_correct_number_of_data_starting_at_correct_index
    @list.append("doop")
    @list.append("bleep")
    @list.append("blop")
    @list.append("boop")
    @list.append("dum")

    assert_equal "blop boop dum", @list.find(2, 3)
    assert_equal "doop bleep", @list.find(0, 2)
    assert_equal "dum", @list.find(4, 1)
  end


  def test_includes_will_return_true_if_list_contains_specified_entry
    @list.append("doop")
    @list.append("bleep")

    assert @list.includes?("bleep")
  end


  def test_includes_will_return_false_if_entry_not_in_list
    @list.append("doop")
    @list.append("bleep")

    refute @list.includes?("monkey")
  end


  def test_pop_will_remove_last_node_of_list
    @list.append("doop")
    @list.append("bleep")
    @list.append("blop")

    assert_equal "blop", @list.pop
    assert_equal "doop", @list.head.data
    assert_equal "bleep", @list.tail.data
    assert_nil @list.tail.next_node
  end


  def test_pop_more_elements_than_in_list_returns_nil
    @list.append("doop")
    @list.append("beep")
    @list.pop
    @list.pop

    assert_nil @list.head
    assert_nil @list.pop
  end

end
