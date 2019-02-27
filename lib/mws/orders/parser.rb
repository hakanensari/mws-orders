# frozen_string_literal: true

require 'nokogiri'
require 'mws/orders/orders'
require 'mws/orders/order_items'
require 'mws/orders/service_status'

module MWS
  module Orders
    class Parser
      include ::Peddler::Headers

      def initialize(response, _encoding)
        @response = response
      end

      def parse
        node = find_result_node

        case node.name
        when /GetServiceStatus/
          ServiceStatus.new(node)
        when /GetOrder/
          Orders.new(node).first
        when /ListOrders/
          Orders.new(node)
        when /ListOrderItems/
          OrderItems.new(node)
        else
          raise NotImplementedError
        end
      end

      def headers
        @response.headers
      end

      def status_code
        @response.status
      end

      def body
        @response.body
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
