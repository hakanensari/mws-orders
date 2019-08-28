# frozen_string_literal: true

require 'mws/orders/document'

module MWS
  module Orders
    class Collection < Document
      include Enumerable

      def each
        raise NotImplementedError
      end

      def empty?
        count.zero?
      end

      def attributes
        map(&:attributes)
      end

      def inspect
        "#<#{self.class.name} #{to_a}>"
      end

      alias to_s inspect
    end
  end
end
