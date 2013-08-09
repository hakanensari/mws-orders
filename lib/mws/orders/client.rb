module MWS
  module Orders
    class Client < ::Peddler::Orders
      extend Forwardable

      def_delegator :orders, :get, :get_order
      def_delegator :orders, :list, :list_orders
      def_delegator :orders, :list_by_next_token, :list_orders_by_next_token
      def_delegator :order_items, :list, :list_order_items
      def_delegator :order_items, :list_by_next_token, :list_order_items_by_next_token
      def_delegator :service_status, :get, :get_service_status

      def orders
        Request::Orders.new(self)
      end

      def order_items
        Request::OrderItems.new(self)
      end

      def service_status
        Request::ServiceStatus.new(self)
      end
    end
  end
end
