# frozen_string_literal: true

require 'mws/orders/entity'
require 'mws/orders/buyer_customized_info'
require 'mws/orders/invoice_data'
require 'mws/orders/points_granted'
require 'mws/orders/product_info'
require 'mws/orders/tax_collection'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#OrderItem
    class OrderItem < Entity
      attribute(:asin) do
        string('ASIN')
      end

      attribute(:order_item_id) do
        string('OrderItemId')
      end

      attribute(:seller_sku) do
        string('SellerSKU')
      end

      attribute(:buyer_customized_info) do
        entity('BuyerCustomizedInfo', BuyerCustomizedInfo)
      end

      attribute(:title) do
        string('Title')
      end

      attribute(:quantity_ordered) do
        integer('QuantityOrdered')
      end

      attribute(:quantity_shipped) do
        integer('QuantityShipped')
      end

      attribute(:points_granted) do
        entity('PointsGranted', PointsGranted)
      end

      attribute(:product_info) do
        entity('ProductInfo', ProductInfo)
      end

      attribute(:item_price) do
        money('ItemPrice')
      end

      attribute(:shipping_price) do
        money('ShippingPrice')
      end

      attribute(:gift_wrap_price) do
        money('GiftWrapPrice')
      end

      attribute(:tax_collection) do
        entity('TaxCollection', TaxCollection)
      end

      attribute(:item_tax) do
        money('ItemTax')
      end

      attribute(:shipping_tax) do
        money('ShippingTax')
      end

      attribute(:gift_wrap_tax) do
        money('GiftWrapPrice')
      end

      attribute(:shipping_discount) do
        money('ShippingDiscount')
      end

      attribute(:promotion_discount) do
        money('PromotionDiscount')
      end

      attribute(:promotion_ids) do
        xpath('PromotionIds').map(&:text)
      end

      attribute(:cod_fee) do
        money('CODFee')
      end

      attribute(:cod_fee_discount) do
        money('CODFeeDiscount')
      end

      attribute(:gift?) do
        boolean('IsGift')
      end

      attribute(:gift_message_text) do
        string('GiftMessageText')
      end

      attribute(:gift_wrap_level) do
        string('GiftWrapLevel')
      end

      attribute(:invoice_data) do
        entity('InvoiceData', InvoiceData)
      end

      attribute(:condition_note) do
        string('ConditionNote')
      end

      attribute(:condition_id) do
        string('ConditionId')
      end

      attribute(:condition_subtype_id) do
        string('ConditionSubtypeId')
      end

      attribute(:scheduled_delivery_starts_at) do
        time('ScheduledDeliveryStartDate')
      end

      attribute(:scheduled_delivery_ends_at) do
        time('ScheduledDeliveryEndDate')
      end

      attribute(:price_designation) do
        string('PriceDesignation')
      end

      attribute(:transparency?) do
        boolean('IsTransparency')
      end

      attribute(:serial_number_required?) do
        boolean('SerialNumberRequired')
      end

      def to_s
        order_item_id
      end
    end
  end
end
