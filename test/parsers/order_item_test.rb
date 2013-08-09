require_relative 'test_helper'

class OrderItemParserTest < ParserTest
  def setup
    node = fixture('order_items').xpath('//xmlns:OrderItem').first
    @order_item = Parser::OrderItem.new(node)
  end

  def test_asin
    skip
  end

  def test_order_item_id
    skip
  end

  def test_seller_sku
    skip
  end

  def test_title
    skip
  end

  def test_quantity_ordered
    skip
  end

  def test_quantity_shipped
    skip
  end

  def test_item_price
    skip
  end

  def test_shipping_price
    skip
  end

  def test_scheduled_delivery_ends_at
    skip
  end

  def test_scheduled_delivery_starts_at
    skip
  end

  def test_cod_fee
    skip
  end

  def test_cod_fee_discount
    skip
  end

  def test_gift_message_text
    skip
  end

  def test_gift_wrap_price
    skip
  end

  def test_gift_wrap_level
    skip
  end
end
