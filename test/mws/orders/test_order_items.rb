# frozen_string_literal: true

require 'test_helper'

class TestOrderItems < MiniTest::Test
  def setup
    node = load_fixture('order_items').xpath('//xmlns:ListOrderItemsResult')
    @order_items = OrderItems.new(node)
  end

  def test_has_order_items
    refute_empty @order_items.to_a
    @order_items.each do |order_item|
      assert_kind_of OrderItem, order_item
    end
  end

  def test_has_next_token
    refute_empty @order_items.next_token
  end

  def test_asin
    order_item = find_order_item(:asin)
    assert_kind_of String, order_item.asin
  end

  def test_order_item_id
    order_item = find_order_item(:order_item_id)
    assert_kind_of String, order_item.order_item_id
  end

  def test_seller_sku
    order_item = find_order_item(:seller_sku)
    assert_kind_of String, order_item.seller_sku
  end

  def test_buyer_customized_info
    order_item = find_order_item(:buyer_customized_info)
    assert_kind_of BuyerCustomizedInfo, order_item.buyer_customized_info
  end

  def test_title
    order_item = find_order_item(:title)
    assert_kind_of String, order_item.title
  end

  def test_quantity_ordered
    order_item = find_order_item(:quantity_ordered)
    assert_kind_of Integer, order_item.quantity_ordered
  end

  def test_quantity_shipped
    order_item = find_order_item(:quantity_shipped)
    assert_kind_of Integer, order_item.quantity_shipped
  end

  def test_points_granted
    order_item = find_order_item(:points_granted)
    assert_kind_of PointsGranted, order_item.points_granted
  end

  def test_product_info
    order_item = find_order_item(:product_info)
    assert_kind_of ProductInfo, order_item.product_info
  end

  def test_item_price
    order_item = find_order_item(:item_price)
    assert_kind_of Money, order_item.item_price
  end

  def test_shipping_price
    order_item = find_order_item(:shipping_price)
    assert_kind_of Money, order_item.shipping_price
  end

  def test_gift_wrap_price
    order_item = find_order_item(:gift_wrap_price)
    assert_kind_of Money, order_item.gift_wrap_price
  end

  def test_tax_collection
    order_item = find_order_item(:tax_collection)
    assert_kind_of TaxCollection, order_item.tax_collection
  end

  def test_item_tax
    skip 'no data point in fixture'
  end

  def test_shipping_tax
    skip 'no data point in fixture'
  end

  def test_gift_wrap_tax
    skip 'no data point in fixture'
  end

  def test_shipping_discount
    skip 'no data point in fixture'
  end

  def test_promotion_discount
    skip 'no data point in fixture'
  end

  def test_promotion_ids
    order_item = find_order_item(:promotion_ids)
    assert_kind_of Array, order_item.promotion_ids
    order_item.promotion_ids.each do |promotion_id|
      assert_kind_of String, promotion_id
    end
  end

  def test_cod_fee
    order_item = find_order_item(:cod_fee)
    assert_kind_of Money, order_item.cod_fee
  end

  def test_cod_fee_discount
    order_item = find_order_item(:cod_fee_discount)
    assert_kind_of Money, order_item.cod_fee_discount
  end

  def test_gift?
    order_item = find_order_item(:gift?)
    refute_nil order_item.gift?
  end

  def test_gift_message_text
    order_item = find_order_item(:gift_message_text)
    assert_kind_of String, order_item.gift_message_text
  end

  def test_gift_wrap_level
    order_item = find_order_item(:gift_wrap_level)
    assert_kind_of String, order_item.gift_wrap_level
  end

  def test_invoice_data
    skip 'no data point in fixture'
  end

  def test_condition_note
    order_item = find_order_item(:condition_note)
    assert_kind_of String, order_item.condition_note
  end

  def test_condition_id
    order_item = find_order_item(:condition_id)
    assert_kind_of String, order_item.condition_id
  end

  def test_condition_subtype_id
    order_item = find_order_item(:condition_subtype_id)
    assert_kind_of String, order_item.condition_subtype_id
  end

  def test_scheduled_delivery_starts_at
    order_item = find_order_item(:scheduled_delivery_starts_at)
    assert_kind_of Time, order_item.scheduled_delivery_starts_at
  end

  def test_scheduled_delivery_ends_at
    order_item = find_order_item(:scheduled_delivery_ends_at)
    assert_kind_of Time, order_item.scheduled_delivery_ends_at
  end

  def test_price_designation
    order_item = find_order_item(:price_designation)
    assert_kind_of String, order_item.price_designation
  end

  def test_transparency?
    order_item = find_order_item(:transparency?)
    refute_nil order_item.transparency?
  end

  def test_serial_number_required?
    order_item = find_order_item(:serial_number_required?)
    refute_nil order_item.serial_number_required?
  end

  def test_to_s
    order_item = @order_items.to_a.sample
    assert_equal order_item.order_item_id, order_item.to_s
  end

  private

  def find_order_item(attribute_name)
    order_items = @order_items.find_all do |order_item|
      value = order_item.send(attribute_name)
      value.is_a?(Array) ? !value.empty? : !value.nil?
    end

    order_items.sample
  end
end
