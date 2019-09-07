# frozen_string_literal: true

require 'test_helper'

class TestProductInfo < MiniTest::Test
  def setup
    node = load_fixture('order_items').at_xpath('//xmlns:ProductInfo')
    @product_info = ProductInfo.new(node)
  end

  def test_number_of_items
    assert_kind_of Integer, @product_info.number_of_items
  end
end
