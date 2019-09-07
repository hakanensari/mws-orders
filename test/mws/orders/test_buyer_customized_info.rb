# frozen_string_literal: true

require 'test_helper'

class TestBuyerCustomizedInfo < MiniTest::Test
  def setup
    node = load_fixture('order_items').at_xpath('//xmlns:BuyerCustomizedInfo')
    @info = BuyerCustomizedInfo.new(node)
  end

  def test_customized_url
    assert_kind_of String, @info.customized_url
  end
end
