# frozen_string_literal: true

require 'test_helper'

class TestParser < MiniTest::Test
  def test_overrides_peddlers_parser
    assert_equal Parser, Client.parser
  end

  def test_response
    parser = Parser.new('response', nil)
    assert parser.response
  end

  def test_parse_list_orders
    parser = Parser.new('response', nil)
    payload = MiniTest::Mock.new
    payload.expect(:name, 'ListOrders')
    parser.stub(:payload, payload) do
      assert_kind_of MWS::Orders::Orders, parser.parse
    end
  end

  def test_parse_get_order
    parser = Parser.new('response', nil)
    payload = MiniTest::Mock.new
    payload.expect(:name, 'GetOrder')
    parser.stub(:payload, payload) do
      assert_kind_of MWS::Orders::Orders, parser.parse
    end
  end

  def test_parse_list_order_items
    parser = Parser.new('response', nil)
    payload = MiniTest::Mock.new
    payload.expect(:name, 'ListOrderItems')
    parser.stub(:payload, payload) do
      assert_kind_of MWS::Orders::OrderItems, parser.parse
    end
  end

  def test_parse_get_service_item
    parser = Parser.new('response', nil)
    payload = MiniTest::Mock.new
    payload.expect(:name, 'GetServiceStatus')
    parser.stub(:payload, payload) do
      assert_kind_of MWS::Orders::ServiceStatus, parser.parse
    end
  end

  def test_raise_when_it_cannot_parse
    parser = Parser.new('response', nil)
    payload = MiniTest::Mock.new
    payload.expect(:name, 'Foo')
    parser.stub(:payload, payload) do
      assert_raises NotImplementedError do
        parser.parse
      end
    end
  end
end
