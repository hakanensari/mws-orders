# frozen_string_literal: true

require 'nokogiri'
require 'mws/orders/orders'
require 'mws/orders/order_items'
require 'mws/orders/service_status'

module MWS
  module Orders
    class Parser
      include ::Peddler::Headers

      SERVICE_STATUS = /GetServiceStatus/
      ORDER          = /GetOrder/
      ORDERS         = /ListOrders/
      ORDER_ITEMS    = /ListOrderItems/

      def initialize(response, _encoding)
        @response = response
      end

      def parse
        node = find_result_node

        case node.name
        when SERVICE_STATUS
          ServiceStatus.new(node)
        when ORDER
          Orders.new(node).first
        when ORDERS
          Orders.new(node)
        when ORDER_ITEMS
          OrderItems.new(node)
        else
          raise NotImplementedError
        end
      end

      def headers
        @response.headers
      end

      private

      def find_result_node
        xml = Nokogiri(@response.body)
        root = xml.children.first

        root.children.find { |node| node.name.include?('Result') }
      end
    end

    # Override Peddler's default Parser.
    Client.parser = Parser
  end
end
