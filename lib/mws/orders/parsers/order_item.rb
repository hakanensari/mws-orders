module MWS
  module Orders
    module Parser
      class OrderItem < Model
        def asin
            text_at_xpath('ASIN')
        end

        def order_item_id
            text_at_xpath('OrderItemId')
        end

        def seller_sku
            text_at_xpath('SellerSKU')
        end

        def title
            text_at_xpath('Title')
        end

        def quantity_ordered
            integer_at_xpath('QuantityOrdered')
        end

        def quantity_shipped
            integer_at_xpath('QuantityShipped')
        end

        def item_price
            money_at_xpath('ItemPrice')
        end

        def shipping_price
            money_at_xpath('ShippingPrice')
        end

        def scheduled_delivery_ends_at
            time_at_xpath('ScheduledDeliveryEndDate')
        end

        def scheduled_delivery_starts_at
            time_at_xpath('ScheduledDeliveryStartDate')
        end

        def cod_fee
            money_at_xpath('CODFee')
        end

        def cod_fee_discount
            money_at_xpath('CODFeeDiscount')
        end

        def gift_message_text
            text_at_xpath('GiftMessageText')
        end

        def gift_wrap_price
            money_at_xpath('GiftWrapPrice')
        end

        def gift_wrap_level
            text_at_xpath('GiftWrapLevel')
        end
      end
    end
  end
end
