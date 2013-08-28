require_relative 'test_helper'

class OrdersTest < IntegrationTest
  def test_lists_and_gets_orders
    @clients.each do |client|
      amazon_order_ids = []
      orders = client.list_orders(created_after: Date.today - 365)
      amazon_order_ids << orders.to_a.sample.amazon_order_id

      orders = client.list_orders_by_next_token
      amazon_order_ids << orders.to_a.sample.amazon_order_id

      orders = client.get_order(*amazon_order_ids)
      assert orders
    end
  end
end
