require "mws/orders/collection"
require "mws/orders/order_item"
require "mws/orders/tokenable"

module MWS
  module Orders
    class OrderItems < Collection
      include Tokenable

      def each(&blk)
        xpath("OrderItems/OrderItem").each { |node| yield OrderItem.new(node) }
      end
    end
  end
end
