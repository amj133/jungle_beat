require './lib/jungle_beat'
require 'minitest/autorun'
require 'minitest/pride'

class JungleBeatTest < Minitest::Test


  def setup
    @jb = JungleBeat.new
  end


  def test_it_exists_with_head_default_to_nil
    assert_instance_of JungleBeat, @jb
    assert_nil @jb.list.head
  end


  def test_data_can_be_appended_to_list
    @jb.append("deep doo ditt")

    assert_equal "deep", @jb.list.head.data
    assert_equal "doo", @jb.list.head.next_node.data
    assert_equal "ditt", @jb.list.tail.data
    assert_nil @jb.list.tail.next_node
    assert_equal 3, @jb.list.count
  end


  def test_data_can_be_appended_twice_to_same_list
    @jb.append("deep doo ditt")
    @jb.append("woo hoo shu")

    assert_equal "deep", @jb.list.head.data
    assert_equal "shu", @jb.list.tail.data
    assert_equal 6, @jb.list.count
    assert_equal "doo ditt woo", @jb.list.find(1, 3)
  end


  def test_play_will_output_tune_to_terminal_to_be_sung
    @jb.append("deep doo ditt")
    @jb.append("woo hoo shu")

    assert_equal `say -r 200 -v Cellos "deep doo ditt woo hoo shu"`,
      @jb.play
  end

end
