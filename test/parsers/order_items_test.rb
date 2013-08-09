require_relative 'test_helper'

class OrderItemsParserTest < ParserTest
  def setup
    node = fixture('order_items').xpath('//xmlns:OrderItems')
    @order_items = Parser::OrderItems.new(node)
  end

  def test_has_order_items
    refute_empty @order_items.to_a
    @order_items.each { |order_item| assert_kind_of Parser::OrderItem, order_item }
  end
end
