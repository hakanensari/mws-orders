require_relative 'test_helper'

class BaseRequestTest < RequestTest
  def setup
    @base = MWS::Orders::Request::Base.new(@client)
  end

  def test_creates_a_structured_list_for_a_single_value
    expected = { 'FooBar.Bar.1' => 'foo' }
    assert_equal expected, @base.structured_list('FooBar', 'foo')
  end

  def test_creates_a_structured_list_for_multiple_values
    expected = { 'FooBar.Bar.1' => 'foo', 'FooBar.Bar.2' => 'bar' }
    assert_equal expected, @base.structured_list('FooBar', %w(foo bar))
  end
end
