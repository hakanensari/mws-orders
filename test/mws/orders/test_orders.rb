require 'test_helper'

class TestOrders < MiniTest::Test
  def setup
    node = load_xml_fixture('orders').xpath('//xmlns:ListOrdersResult')
    @orders = Orders.new(node)
  end

  def test_has_orders
    refute_empty @orders.to_a
    @orders.each do |order|
      assert_kind_of Order, order
    end
  end

  def test_has_next_token
    refute_empty @orders.next_token
  end
end
