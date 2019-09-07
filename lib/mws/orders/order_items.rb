# frozen_string_literal: true

require 'mws/orders/collection'
require 'mws/orders/order_item'
require 'mws/orders/tokenable'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_ListOrderItems.html
    class OrderItems < Collection
      include Tokenable

      def each
        xpath('OrderItems/OrderItem').each { |node| yield OrderItem.new(node) }
      end
    end
  end
end
