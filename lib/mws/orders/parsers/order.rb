module MWS
  module Orders
    module Parser
      class Order < Model
        value :amazon_order_id do
          text_at_xpath('AmazonOrderId')
        end

        value :purchased_at do
          time_at_xpath('PurchaseDate')
        end

        value :last_updated_at do
          time_at_xpath('LastUpdateDate')
        end

        value :status do
          text_at_xpath('OrderStatus')
        end

        value :type do
          text_at_xpath('OrderType')
        end

        value :sales_channel do
          text_at_xpath('SalesChannel')
        end

        value :ship_service_level do
          text_at_xpath('ShipServiceLevel')
        end

        value :fulfillment_channel do
          text_at_xpath('FulfillmentChannel')
        end

        value :total do
          money_at_xpath('OrderTotal')
        end

        value :shipping_address do
          ShippingAddress.new(at_xpath('ShippingAddress'))
        end

        value :number_of_items_shipped do
          integer_at_xpath('NumberOfItemsShipped')
        end

        value :number_of_items_unshipped do
          integer_at_xpath('NumberOfItemsUnshipped')
        end

        value :payment_execution_detail do
          PaymentExecutionDetail.new(at_xpath('PaymentExecutionDetail'))
        end

        value :payment_method do
          text_at_xpath('PaymentMethod')
        end

        value :marketplace_id do
          text_at_xpath('MarketplaceId')
        end

        value :buyer_name do
          text_at_xpath('BuyerName')
        end

        value :buyer_email do
          text_at_xpath('BuyerEmail')
        end

        value :shipment_service_level_category do
          text_at_xpath('ShipmentServiceLevelCategory')
        end
      end
    end
  end
end
