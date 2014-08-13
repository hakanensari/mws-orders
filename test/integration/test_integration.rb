require "test_helper"

class TestIntegration < MiniTest::Test
  def setup
    skip if ENV['CI']
    @client = MWS.orders
  end

  def test_gets_service_status
    assert_kind_of ServiceStatus, @client.get_service_status
  end

  def test_lists_orders
    orders = @client.list_orders(created_after: Date.today - 30)
    refute_empty orders

    next_orders = @client.list_orders_by_next_token(orders.next_token)
    refute_empty orders

    amazon_order_id = next_orders.to_a.sample.amazon_order_id
    order_items = @client.list_order_items(amazon_order_id)
    refute_empty order_items
  end
end
