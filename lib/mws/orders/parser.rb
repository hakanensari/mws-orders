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
        case payload.name
        when /GetOrderResult/         then orders
        when /ListOrders.*Result/     then orders
        when /ListOrderItems.*Result/ then order_items
        when 'GetServiceStatusResult' then service_status
        else raise NotImplementedError
        end
      end

      def payload
        @payload ||= find_payload
      end

      private

      def orders
        Orders.new(payload)
      end

      def order_items
        OrderItems.new(payload)
      end

      def service_status
        ServiceStatus.new(payload)
      end

      def find_payload
        xml = Nokogiri(response.body)
        root = xml.children.first

        root.children.find { |node| node.name.include?('Result') }
      end
    end

    Client.parser = Parser
  end
end
