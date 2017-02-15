require 'mws/orders/collection'
require 'mws/orders/order'
require 'mws/orders/tokenable'

module MWS
  module Orders
    class Orders < Collection
      include Tokenable

      def each
        xpath('Orders/Order').map { |node| yield Order.new(node) }
      end
    end
  end
end
