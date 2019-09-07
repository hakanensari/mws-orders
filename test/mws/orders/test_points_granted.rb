# frozen_string_literal: true

require 'test_helper'

class TestPointsGranted < MiniTest::Test
  def setup
    node = load_fixture('order_items').at_xpath('//xmlns:PointsGranted')
    @points_granted = PointsGranted.new(node)
  end

  def test_number
    assert_kind_of Integer, @points_granted.number
  end

  def test_monetary_value
    assert_kind_of Money, @points_granted.monetary_value
  end
end
