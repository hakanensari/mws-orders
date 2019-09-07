# frozen_string_literal: true

require 'mws/orders/collection'
require 'mws/orders/order'
require 'mws/orders/tokenable'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_ListOrders.html
    class Orders < Collection
      include Tokenable

      def each
        xpath('Orders/Order').each { |node| yield Order.new(node) }
      end
    end
  end
end
