# frozen_string_literal: true

module MWS
  module Orders
    # Wraps a Nokogiri node
    class Document
      attr_reader :node

      def initialize(node)
        @node = node
      end

      def xpath(path)
        node.xpath(add_namespace(path), namespaces)
      end

      def at_xpath(path)
        node.at_xpath(add_namespace(path), namespaces)
      end

      private

      def add_namespace(path)
        path.split('/')
            .map { |attr| attr.include?(':') ? attr : "xmlns:#{attr}" }
            .join('/')
      end

      def namespaces
        @namespaces ||= collect_namespaces
      end

      def collect_namespaces
        document = node&.document || node
        document.collect_namespaces.each_with_object({}) do |namespace, hsh|
          key, val = namespace
          hsh[key.sub(/^xmlns:/, '')] = val
        end
      end
    end
  end
end
