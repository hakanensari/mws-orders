# frozen_string_literal: true

module MWS
  module Orders
    class Document
      attr_reader :node

      def initialize(node)
        @node = node
      end

      def xpath(path)
        node.xpath(add_namespace(path))
      end

      private

      def add_namespace(path)
        path
          .split('/')
          .map { |attr| "xmlns:#{attr}" }
          .join('/')
      end
    end
  end
end
