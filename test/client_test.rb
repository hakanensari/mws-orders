require_relative 'test_helper'
require 'yaml'

class ClientTest < MiniTest::Test
  def mws_accounts
    YAML.load_file(File.expand_path('../fixtures/mws.yml', __FILE__))
  end

  def each_client(&blk)
    mws_accounts.each do |mws|
      yield Client.new(*mws.values)
    end
  end

  def test_manages_orders
    each_client do |client|
      client.list_orders(created_after: Date.today - 365)
      order = client.list_orders_by_next_token.first
      refute_empty client.get_order(order.amazon_order_id)
    end
  end

  def test_manages_order_items
    each_client do |client|
      order = client.list_orders(created_after: Date.today - 365).first
      refute_empty client.list_order_items(order.amazon_order_id)
    end
  end

  def test_gets_service_status
    each_client do |client|
      status = client.get_service_status
      refute_empty status.to_s
    end
  end
end
