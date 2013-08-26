require_relative '../test_helper'

class StructuredListHelperTest < MiniTest::Test
  def setup
    @structured_list = Helper::StructuredList.new(:order_status)
  end

  def test_builds_a_structured_list_for_a_single_value
    exp = { 'OrderStatus.Status.1' => 'foo' }
    assert_equal(exp, @structured_list.build('foo'))
  end

  def test_builds_a_structured_list_for_an_array_of_values
    exp = { 'OrderStatus.Status.1' => 'foo', 'OrderStatus.Status.2' => 'bar' }
    assert_equal(exp, @structured_list.build(%w(foo bar)))
  end
end
