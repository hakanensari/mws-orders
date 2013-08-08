module MWS
  module Orders
    module Parser
      class Order < Model
        def amazon_order_id
          text_at_xpath('AmazonOrderId')
        end

        def purchased_at
          time_at_xpath('PurchaseDate')
        end

        def last_updated_at
          time_at_xpath('LastUpdatedDate')
        end

        def status
          text_at_xpath('OrderStatus')
        end

        def type
          text_at_xpath('OrderType')
        end

        def sales_channel
          text_at_xpath('SalesChannel')
        end

        def ship_service_level
          text_at_xpath('ShipServiceLevel')
        end

        def fulfillment_channel
          text_at_xpath('FulfillmentChannel')
        end

        def total
          money_at_xpath('OrderTotal')
        end

        def shipping_address
          ShippingAddress.new(at_xpath('ShippingAddress'))
        end

        def number_of_items_shipped
          integer_at_xpath('NumberOfItemsShipped')
        end

        def number_of_items_unshipped
          integer_at_xpath('NumberOfItemsUnshipped')
        end

        def payment_execution_detail
          PaymentExecutionDetail.new(at_xpath('PaymentExecutionDetail'))
        end

        def payment_method
          text_at_xpath('PaymentMethod')
        end

        def marketplace_id
          text_at_xpath('MarketplaceId')
        end

        def buyer_name
          text_at_xpath('BuyerName')
        end

        def buyer_email
          text_at_xpath('BuyerEmail')
        end

        def shipment_service_level_category
          text_at_xpath('ShipmentServiceLevelCategory')
        end
      end
    end
  end
end
