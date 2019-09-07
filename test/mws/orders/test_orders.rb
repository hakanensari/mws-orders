# frozen_string_literal: true

require 'test_helper'

class TestOrders < MiniTest::Test
  def setup
    node = load_fixture('orders').xpath('//xmlns:ListOrdersResult')
    @orders = Orders.new(node)
  end

  def test_has_orders
    refute_empty @orders.to_a
    @orders.each do |order|
      assert_kind_of Order, order
    end
  end

  def test_has_next_token
    refute_empty @orders.next_token
  end

  def test_amazon_order_id
    order = find_order(:amazon_order_id)
    assert_kind_of String, order.amazon_order_id
  end

  def test_seller_order_id
    skip 'no data point in fixture'
  end

  def test_purchased_at
    order = find_order(:purchased_at)
    assert_kind_of Time, order.purchased_at
  end

  def test_last_updated_at
    order = find_order(:last_updated_at)
    assert_kind_of Time, order.last_updated_at
  end

  def test_status
    order = find_order(:status)
    assert_kind_of String, order.status
  end

  def test_fulfillment_channel
    order = find_order(:fulfillment_channel)
    assert_kind_of String, order.fulfillment_channel
  end

  def test_sales_channel
    order = find_order(:sales_channel)
    assert_kind_of String, order.sales_channel
  end

  def test_order_channel
    skip 'no data point in fixture'
  end

  def test_ship_service_level
    order = find_order(:ship_service_level)
    assert_kind_of String, order.ship_service_level
  end

  def test_shipping_address
    order = find_order(:shipping_address)
    assert_kind_of Address, order.shipping_address
  end

  def test_total
    order = find_order(:total)
    assert_kind_of Money, order.total
  end

  def test_number_of_items_shipped
    order = find_order(:number_of_items_shipped)
    assert_kind_of Integer, order.number_of_items_shipped
  end

  def test_number_of_items_unshipped
    order = find_order(:number_of_items_unshipped)
    assert_kind_of Integer, order.number_of_items_unshipped
  end

  def test_payment_execution_detail
    order = find_order(:payment_execution_detail)
    refute_empty order.payment_execution_detail
    order.payment_execution_detail.each do |item|
      assert_kind_of PaymentExecutionDetailItem, item
    end
  end

  def test_payment_method
    order = find_order(:payment_method)
    assert_kind_of String, order.payment_method
  end

  def test_payment_method_details
    order = find_order(:payment_method_details)
    refute_empty order.payment_method_details.to_a
    order.payment_method_details.each do |detail|
      assert_kind_of String, detail
    end
  end

  def test_replacement_order?
    order = find_order(:replacement_order?)
    refute_nil order.replacement_order?
  end

  def test_replaced_order_id
    skip 'no data point in fixture'
  end

  def test_marketplace_id
    order = find_order(:marketplace_id)
    assert_kind_of String, order.marketplace_id
  end

  def test_buyer_email
    order = find_order(:buyer_email)
    assert_kind_of String, order.buyer_email
  end

  def test_buyer_name
    order = find_order(:buyer_name)
    assert_kind_of String, order.buyer_name
  end

  def test_buyer_county
    order = find_order(:buyer_county)
    assert_kind_of String, order.buyer_county
  end

  def test_buyer_tax_info
    order = find_order(:buyer_tax_info)
    assert_kind_of BuyerTaxInfo, order.buyer_tax_info
  end

  def test_shipment_service_level_category
    order = find_order(:shipment_service_level_category)
    assert_kind_of String, order.shipment_service_level_category
  end

  def test_shipped_by_amazon_tfm
    skip 'no data point in fixture'
  end

  def test_tfm_shipment_status
    skip 'no data point in fixture'
  end

  def test_easy_ship_shipment_status
    skip 'no data point in fixture'
  end

  def test_type
    order = find_order(:type)
    assert_kind_of String, order.type
  end

  def test_earliest_shipped_at
    order = find_order(:latest_shipped_at)
    assert_kind_of Time, order.latest_shipped_at
  end

  def test_latest_shipped_at
    order = find_order(:latest_shipped_at)
    assert_kind_of Time, order.latest_shipped_at
  end

  def test_earliest_delivered_at
    skip 'no data point in fixture'
  end

  def test_latest_delivered_at
    skip 'no data point in fixture'
  end

  def test_business_order?
    order = find_order(:business_order?)
    refute_nil order.business_order?
  end

  def test_purchase_order_number
    order = find_order(:purchase_order_number)
    assert_kind_of String, order.purchase_order_number
  end

  def test_prime?
    order = find_order(:prime?)
    refute_nil order.prime?
  end

  def test_premium?
    order = find_order(:premium?)
    refute_nil order.premium?
  end

  def test_promise_response_due_at
    order = find_order(:promise_response_due_at)
    assert_kind_of Time, order.promise_response_due_at
  end

  def test_estimated_ship_date_set?
    order = find_order(:estimated_ship_date_set?)
    refute_nil order.estimated_ship_date_set?
  end

  def test_to_s
    order = @orders.to_a.sample
    assert_equal order.amazon_order_id, order.to_s
  end

  private

  def find_order(attribute_name)
    orders = @orders.find_all do |order|
      value = order.send(attribute_name)
      value.is_a?(Array) ? !value.empty? : !value.nil?
    end

    orders.sample
  end
end
