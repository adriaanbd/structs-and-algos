require 'minitest/autorun'
load 'node.rb'
load 'stack.rb'

class StackTest < MiniTest::Test
  def test_init_returns_stack
    s = Stack.new
    assert_instance_of(Stack, s)
  end

  def test_init_vars_defaults
    s = Stack.new
    assert_nil(s.head)
    assert_equal(0, s.size)
  end

  def test_push
    s = Stack.new
    s.push(3)
    s.push(5)
    assert_equal(2, s.size)
  end

  def test_push_and_head
    s = Stack.new
    s.push(3)
    assert_equal(3, s.head.key)
    s.push(5)
    assert_equal(5, s.head.key)
    s.push(7)
    assert_equal(7, s.head.key)
    s.push(9)
    assert_equal(9, s.head.key)
  end

  def test_size_after_single_pop
    s = Stack.new
    s.push(3)
    s.pop
    assert_equal(0, s.size)
  end

  def test_head_after_single_pop
    s = Stack.new
    s.push(3)
    assert_equal(3, s.head.key)
    s.pop
    assert_nil(s.head)
  end

  def test_push_and_pop
    s = Stack.new
    s.push(3)
    s.push(5)
    assert_equal(5, s.head.key)
    assert_equal(5, s.pop)
    assert_equal(3, s.head.key)
    assert_equal(1, s.size)
  end

  def test_multiple_push_and_pops
    s = Stack.new
    s.push(3)
    s.push(5)
    s.push(10)
    assert_equal(10, s.head.key)
    assert_equal(10, s.pop)
    assert_equal(5, s.head.key)
    assert_equal(5, s.pop)
    assert_equal(3, s.head.key)
    assert_equal(3, s.pop)
    assert_equal(0, s.size)
  end

  def test_pop_on_empty_return_error
    s = Stack.new
    assert_nil(s.pop)
  end

  def test_top
    s = Stack.new
    s.push(3)
    s.push(5)
    assert_equal(5, s.top)
  end

  def test_top_on_empty_return_error
    s = Stack.new
    assert_nil(s.top)
  end

end