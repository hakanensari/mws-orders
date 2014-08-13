require "test_helper"

class TestOrderItems < MiniTest::Test
  def setup
    node = load_xml_fixture("order_items").xpath("//xmlns:ListOrderItemsResult")
    @order_items = OrderItems.new(node)
  end

  def test_has_order_items
    refute_empty @order_items.to_a
    @order_items.each do |order_item|
      assert_kind_of OrderItem, order_item
    end
  end

  def test_has_next_token
    refute_empty @order_items.next_token
  end
end
