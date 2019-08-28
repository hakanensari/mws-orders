# frozen_string_literal: true

require 'nokogiri'
require 'mws/orders/orders'
require 'mws/orders/order_items'
require 'mws/orders/service_status'
require 'peddler'

module MWS
  module Orders
    class Parser
      include ::Peddler::Headers

      def initialize(response, _encoding)
        @response = response
      end

      def parse
        case result_node.name
        when /GetOrder/         then order
        when /GetServiceStatus/ then service_status
        when /ListOrders/       then orders
        when /ListOrderItems/   then order_items
        else raise NotImplementedError
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

      def order
        orders.first
      end

      def orders
        Orders.new(result_node)
      end

      def order_items
        OrderItems.new(result_node)
      end

      def service_status
        ServiceStatus.new(result_node)
      end

      def result_node
        @result_node ||= find_result_node
      end

      def find_result_node
        xml = Nokogiri(body)
        root = xml.children.first

        root.children.find { |node| node.name.include?('Result') }
      end
    end

    # Override Peddler's default Parser.
    Client.parser = Parser
  end
end
