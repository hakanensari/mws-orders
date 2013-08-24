require_relative '../test_helper'

class ParamsHelperTest < MiniTest::Test
  include Request::Helper

  def setup
    @params = Params.new('an action')
  end

  def test_has_an_action_key
    assert_equal 'an action', @params.fetch('Action')
  end

  def test_formats_timestamps
    ts = Minitest::Mock.new
    ts.expect(:iso8601, 'formatted')
    @params.store('a timestamp', ts)
    assert_equal 'formatted', @params.timestamp!.fetch('a timestamp')
  end

  def test_formats_structured_lists
    @params.store(:order_status, 'foo')
    assert_equal 'foo', @params.format_structured_lists!.fetch('OrderStatus.Status.1')
  end

  def test_camelizes_keys
    @params.store(:underscored_key, 'baz')
    refute @params.camelize_keys!.has_key?(:underscored_key)
    assert @params.has_key?('UnderscoredKey')
  end
end
