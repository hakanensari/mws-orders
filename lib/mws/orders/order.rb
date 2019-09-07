# frozen_string_literal: true

require 'mws/orders/entity'
require 'mws/orders/address'
require 'mws/orders/buyer_tax_info'
require 'mws/orders/payment_execution_detail_item'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#Order
    class Order < Entity
      attribute(:amazon_order_id) do
        string('AmazonOrderId')
      end

      attribute(:seller_order_id) do
        string('SellerOrderId')
      end

      attribute(:purchased_at) do
        time('PurchaseDate')
      end

      attribute(:last_updated_at) do
        time('LastUpdateDate')
      end

      attribute(:status) do
        string('OrderStatus')
      end

      attribute(:fulfillment_channel) do
        string('FulfillmentChannel')
      end

      attribute(:sales_channel) do
        string('SalesChannel')
      end

      attribute(:order_channel) do
        string('OrderChannel')
      end

      attribute(:ship_service_level) do
        string('ShipServiceLevel')
      end

      attribute(:shipping_address) do
        entity('ShippingAddress', Address)
      end

      attribute(:total) do
        money('OrderTotal')
      end

      attribute(:number_of_items_shipped) do
        integer('NumberOfItemsShipped')
      end

      attribute(:number_of_items_unshipped) do
        integer('NumberOfItemsUnshipped')
      end

      attribute(:payment_execution_detail) do
        xpath('PaymentExecutionDetail/PaymentExecutionDetailItem')
          .map { |node| PaymentExecutionDetailItem.new(node) }
      end

      attribute(:payment_method) do
        string('PaymentMethod')
      end

      attribute(:payment_method_details) do
        xpath('PaymentMethodDetails/PaymentMethodDetail').map(&:text)
      end

      attribute(:replacement_order?) do
        boolean('IsReplacementOrder')
      end

      attribute(:replaced_order_id) do
        string('ReplacedOrderId')
      end

      attribute(:marketplace_id) do
        string('MarketplaceId')
      end

      attribute(:buyer_email) do
        string('BuyerEmail')
      end

      attribute(:buyer_name) do
        string('BuyerName')
      end

      attribute(:buyer_county) do
        string('BuyerCounty')
      end

      attribute(:buyer_tax_info) do
        entity('BuyerTaxInfo', BuyerTaxInfo)
      end

      attribute(:shipment_service_level_category) do
        string('ShipmentServiceLevelCategory')
      end

      attribute(:shipped_by_amazon_tfm) do
        string('ShippedByAmazonTFM')
      end

      attribute(:tfm_shipment_status) do
        string('TFMShipmentStatus')
      end

      attribute(:easy_ship_shipment_status) do
        string('EasyShipShipmentStatus')
      end

      attribute(:type) do
        string('OrderType')
      end

      attribute(:earliest_shipped_at) do
        time('EarliestShipDate')
      end

      attribute(:latest_shipped_at) do
        time('LatestShipDate')
      end

      attribute(:earliest_delivered_at) do
        time('LatestDeliveryDate')
      end

      attribute(:latest_delivered_at) do
        time('LatestDeliveryDate')
      end

      attribute(:business_order?) do
        boolean('IsBusinessOrder')
      end

      attribute(:purchase_order_number) do
        string('PurchaseOrderNumber')
      end

      attribute(:prime?) do
        boolean('IsPrime')
      end

      attribute(:premium?) do
        boolean('IsPremiumOrder')
      end

      attribute(:promise_response_due_at) do
        time('PromiseResponseDueDate')
      end

      attribute(:estimated_ship_date_set?) do
        boolean('IsEstimatedShipDateSet')
      end

      def to_s
        amazon_order_id
      end
    end
  end
end
