require "test_helper"

class TestOrder < MiniTest::Test
  def setup
    node = load_xml_fixture("orders").at_xpath("//xmlns:Order")
    @order = Order.new(node)
  end

  def test_amazon_order_id
    assert_kind_of String, @order.amazon_order_id
  end

  def test_purchase_time
    assert_kind_of Time, @order.purchased_at
  end

  def test_last_update_time
    assert_kind_of Time, @order.last_updated_at
  end

  def test_status
    assert_kind_of String, @order.status
  end

  def test_type
    assert_kind_of String, @order.type
  end

  def test_sales_channel
    assert_kind_of String, @order.sales_channel
  end

  def test_ship_service_level
    assert_kind_of String, @order.ship_service_level
  end

  def test_fulfillment_channel
    assert_kind_of String, @order.fulfillment_channel
  end

  def test_total
    assert_kind_of Money, @order.total
  end

  def test_shipping_address
    assert_kind_of ShippingAddress, @order.shipping_address
  end

  def test_number_of_items_shipped
    assert_kind_of Integer, @order.number_of_items_shipped
  end

  def test_number_of_items_unshipped
    assert_kind_of Integer, @order.number_of_items_unshipped
  end

  def test_payment_execution_detail
    assert_kind_of PaymentExecutionDetail, @order.payment_execution_detail
  end

  def test_payment_method
    assert_kind_of String, @order.payment_method
  end

  def test_marketplace_id
    assert_kind_of String, @order.marketplace_id
  end

  def test_buyer_name
    assert_kind_of String, @order.buyer_name
  end

  def test_buyer_email
    assert_kind_of String, @order.buyer_email
  end

  def test_shipment_service_level_category
    assert_kind_of String, @order.shipment_service_level_category
  end

  def test_no_shipping_adress
    @order.xpath('ShippingAddress').remove
    assert_nil @order.shipping_address
  end

  def test_latest_shipped_at
    assert_kind_of Time, @order.latest_shipped_at
  end

  def test_latest_delivery_date
    assert_kind_of Time, @order.latest_delivery_date
  end
end
