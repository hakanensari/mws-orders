require "test_helper"

class TestMWSOrders < MiniTest::Test
  def setup
    skip unless ENV['AWS_ACCESS_KEY_ID']
    @client = MWS.orders
  end

  def test_gets_service_status
    assert_kind_of ServiceStatus, @client.get_service_status.parse
  end

  def test_lists_orders_and_their_items
    orders = @client.list_orders(created_after: one_year_ago).parse
    refute_empty orders
    amazon_order_id = orders.to_a.sample.amazon_order_id
    assert_kind_of MWS::Orders::Order, @client.get_order(amazon_order_id).parse
    order_items = @client.list_order_items(amazon_order_id).parse
    refute_empty order_items
  end

  private

  def one_year_ago
    Date.today - 365
  end
end
