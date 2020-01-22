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
    document = load_fixture('orders')
    parser.stub(:document, document) do
      assert_kind_of Orders, parser.parse
    end
  end

  def test_parse_list_orders_by_next_token
    parser = Parser.new('response', nil)
    document = load_fixture('orders_by_next_token')
    parser.stub(:document, document) do
      assert_kind_of Orders, parser.parse
    end
  end

  def test_parse_get_order
    parser = Parser.new('response', nil)
    document = load_fixture('order')
    parser.stub(:document, document) do
      assert_kind_of Orders, parser.parse
    end
  end

  def test_parse_list_order_items
    parser = Parser.new('response', nil)
    document = load_fixture('order_items')
    parser.stub(:document, document) do
      assert_kind_of OrderItems, parser.parse
    end
  end

  def test_parse_list_order_items_by_next_token
    parser = Parser.new('response', nil)
    document = load_fixture('order_items_by_next_token')
    parser.stub(:document, document) do
      assert_kind_of OrderItems, parser.parse
    end
  end

  def test_parse_get_service_status
    parser = Parser.new('response', nil)
    document = load_fixture('service_status')
    parser.stub(:document, document) do
      assert_kind_of ServiceStatus, parser.parse
    end
  end

  def test_raise_when_it_cannot_parse
    parser = Parser.new('response', nil)
    payload = MiniTest::Mock.new
    payload.expect(:name, 'Foo')
    parser.stub(:payload, payload) do
      assert_raises StandardError, 'not implemented' do
        parser.parse
      end
    end
  end
end
