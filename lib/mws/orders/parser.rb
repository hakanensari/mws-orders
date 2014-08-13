require "nokogiri"
require "mws/orders/orders"
require "mws/orders/order_items"
require "mws/orders/service_status"

module MWS
  module Orders
    class Parser
      SERVICE_STATUS = /ServiceStatus/
      ORDERS         = /Orders/
      ORDER_ITEMS    = /OrderItems/

      def self.parse(response, _)
        new(response).parse
      end

      def initialize(response)
        @response = response
      end

      def parse
        node = find_result_node

        case node.name
        when SERVICE_STATUS
          ServiceStatus.new(node)
        when ORDERS
          Orders.new(node)
        when ORDER_ITEMS
          OrderItems.new(node)
        end
      end

      private

      def find_result_node
        xml = Nokogiri(@response.body)
        root = xml.children.first

        root.children.find { |node| node.name.include?("Result") }
      end
    end
  end
end
