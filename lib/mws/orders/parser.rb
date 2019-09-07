# frozen_string_literal: true

require 'nokogiri'
require 'mws/orders/orders'
require 'mws/orders/order_items'
require 'mws/orders/service_status'
require 'peddler'

module MWS
  # With the MWS Orders API, you can list orders created or updated during a
  # time frame you specify or retrieve information about specific orders.
  module Orders
    # Overrides the default parser in Peddler
    class Parser
      include ::Peddler::Headers

      attr_reader :response

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
        xml = Nokogiri(response.body)
        root = xml.children.first

        root.children.find { |node| node.name.include?('Result') }
      end
    end

    Client.parser = Parser
  end
end
