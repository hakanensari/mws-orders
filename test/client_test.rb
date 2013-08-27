require_relative 'test_helper'
require 'yaml'

class ClientTest < MiniTest::Test
  def mws_credentials
    YAML.load_file(File.expand_path('../fixtures/mws.yml', __FILE__))
  end

  def setup
    @client = Client.new(*mws_credentials.values)
  end

  def test_manages_orders
    @client.list_orders(created_after: Date.today - 365)
    order = @client.list_orders_by_next_token.first
    refute_empty @client.get_order(order.amazon_order_id)
  end

  def test_gets_service_status
    status = @client.get_service_status
    refute_empty status.to_s
  end
end
