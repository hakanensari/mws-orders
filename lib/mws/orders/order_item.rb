require "mws/orders/entity"
require "mws/orders/invoice_data"

module MWS
  module Orders
    class OrderItem < Entity
      attribute(:asin) do
        text_at_xpath("ASIN")
      end

      attribute(:seller_sku) do
        text_at_xpath("SellerSKU")
      end

      attribute(:order_item_id) do
        text_at_xpath("OrderItemId")
      end

      attribute(:title) do
        text_at_xpath("Title")
      end

      attribute(:quantity_ordered) do
        integer_at_xpath("QuantityOrdered")
      end

      attribute(:quantity_shipped) do
        integer_at_xpath("QuantityShipped")
      end

      attribute(:gift_message_text) do
        text_at_xpath("GiftMessageText")
      end

      attribute(:gift_wrap_level) do
        text_at_xpath("GiftWrapLevel")
      end

      attribute(:item_price) do
        money_at_xpath("ItemPrice")
      end

      attribute(:shipping_price) do
        money_at_xpath("ShippingPrice")
      end

      attribute(:gift_wrap_price) do
        money_at_xpath("GiftWrapPrice")
      end

      attribute(:item_tax) do
        money_at_xpath("ItemTax")
      end

      attribute(:shipping_tax) do
        money_at_xpath("ShippingTax")
      end

      attribute(:gift_wrap_tax) do
        money_at_xpath("GiftWrapPrice")
      end

      attribute(:shipping_discount) do
        money_at_xpath("ShippingDiscount")
      end

      attribute(:promotion_discount) do
        money_at_xpath("PromotionDiscount")
      end

      attribute(:promotion_ids) do
        xpath("PromotionId").map(&:text)
      end

      attribute(:cod_fee) do
        money_at_xpath("CODFee")
      end

      attribute(:cod_fee_discount) do
        money_at_xpath("CODFeeDiscount")
      end

      attribute(:invoice_data) do
        xpath("InvoiceData").map { |node| InvoiceData.new(node) }
      end

      attribute(:condition_id) do
        text_at_xpath("ConditionId")
      end

      attribute(:condition_subtype_id) do
        text_at_xpath("ConditionSubtypeId")
      end

      attribute(:condition_note) do
        text_at_xpath("ConditionNote")
      end

      attribute(:scheduled_delivery_ends_at) do
        time_at_xpath("ScheduledDeliveryEndDate")
      end

      attribute(:scheduled_delivery_starts_at) do
        time_at_xpath("ScheduledDeliveryStartDate")
      end
    end
  end
end
