require "mws/orders/entity"
require "mws/orders/shipping_address"
require "mws/orders/payment_execution_detail"

module MWS
  module Orders
    class Order < Entity
      attribute(:amazon_order_id) do
        text_at_xpath("AmazonOrderId")
      end

      attribute(:seller_order_id) do
        text_at_xpath("SellerOrderId")
      end

      attribute(:purchased_at) do
        time_at_xpath("PurchaseDate")
      end

      attribute(:last_updated_at) do
        time_at_xpath("LastUpdateDate")
      end

      attribute(:status) do
        text_at_xpath("OrderStatus")
      end

      attribute(:fulfillment_channel) do
        text_at_xpath("FulfillmentChannel")
      end

      attribute(:sales_channel) do
        text_at_xpath("SalesChannel")
      end

      attribute(:order_channel) do
        text_at_xpath("OrderChannel")
      end

      attribute(:ship_service_level) do
        text_at_xpath("ShipServiceLevel")
      end

      attribute(:shipping_address) do
        if node = xpath("ShippingAddress").first
          ShippingAddress.new(node)
        end
      end

      attribute(:total) do
        money_at_xpath("OrderTotal")
      end

      attribute(:number_of_items_shipped) do
        integer_at_xpath("NumberOfItemsShipped")
      end

      attribute(:number_of_items_unshipped) do
        integer_at_xpath("NumberOfItemsUnshipped")
      end

      attribute(:payment_execution_detail) do
        if node = xpath("PaymentExecutionDetail").first
          PaymentExecutionDetail.new(node)
        end
      end

      attribute(:payment_method) do
        text_at_xpath("PaymentMethod")
      end

      attribute(:marketplace_id) do
        text_at_xpath("MarketplaceId")
      end

      attribute(:buyer_name) do
        text_at_xpath("BuyerName")
      end

      attribute(:buyer_email) do
        text_at_xpath("BuyerEmail")
      end

      attribute(:shipment_service_level_category) do
        text_at_xpath("ShipmentServiceLevelCategory")
      end

      attribute(:cba_displayable_shipping_label) do
        text_at_xpath("CbaDisplayableShippingLabel")
      end

      attribute(:shipped_by_amazon_tfm) do
        text_at_xpath("ShippedByAmazonTFM")
      end

      attribute(:tfm_shipment_status) do
        text_at_xpath("TFMShipmentStatus")
      end

      attribute(:type) do
        text_at_xpath("OrderType")
      end

      attribute(:earliest_shipped_at) do
        time_at_xpath("EarliestShipDate")
      end

      attribute(:latest_shipped_at) do
        time_at_xpath("LatestShipDate")
      end

      attribute(:latest_delivery_date) do
        time_at_xpath('LatestDeliveryDate')
      end
    end
  end
end
