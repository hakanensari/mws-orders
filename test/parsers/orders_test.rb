require_relative 'test_helper'

class OrdersParserTest < ParserTest
  def setup
    node = fixture.xpath('//xmlns:Orders')
    @orders = Parser::Orders.new(node)
  end

  def test_has_orders
    refute_empty @orders.to_a
    @orders.each { |order| assert_kind_of Parser::Order, order }
  end
end
