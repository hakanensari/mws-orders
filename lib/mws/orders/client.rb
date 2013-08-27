module MWS
  module Orders
    class Client < ::Peddler::Orders
      extend Forwardable

      # Public: Gets one or more orders.
      #
      # amazon_order_ids - One or more String Amazon order ids.
      #
      # Examples
      #
      #   client.get_order('123-1234567-1234567')
      #
      # Returns Orders.
      def_delegator :orders, :get, :get_order

      # Public: List orders created or updated during a specified time frame.
      #
      # params - The Hash request parameters used to narrow the orders list.
      #          Refer to the MWS Orders API for available parameters.
      #
      # Examples
      #
      #   client.list_orders(created_after: 1.week.ago)
      #
      # Returns Orders.
      def_delegator :orders, :list, :list_orders

      # Public: Lists the next page of orders using the NextToken parameter.
      #
      # Examples
      #
      #   client.list_orders_by_next_token
      #
      # Returns Orders.
      def_delegator :orders, :list_by_next_token, :list_orders_by_next_token

      def_delegator :order_items, :list, :list_order_items
      def_delegator :order_items, :list_by_next_token, :list_order_items_by_next_token
      def_delegator :service_status, :get, :get_service_status

      def home_marketplace_id
        marketplace_id(country)
      end

      private

      def orders
        @orders ||= Request::Orders.new(self)
      end

      def order_items
        @order_items ||= Request::OrderItems.new(self)
      end

      def service_status
        @service_status ||= Request::ServiceStatus.new(self)
      end
    end
  end
end
