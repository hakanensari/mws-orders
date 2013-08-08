require_relative 'test_helper'

class OrdersParserTest < ParserTest
  def setup
    @orders = Parser::Orders.new(fixture)
  end

  def test_has_orders
    refute_empty @orders.to_a
    @orders.each { |order| assert_kind_of Parser::Order, order }
  end
end
