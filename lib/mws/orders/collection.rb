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

      def inspect
        "#<#{self.class} #{if count > 3
                             "[#{take(3).map(&:inspect).join(', ')}...]"
                           else
                             "[#{map(&:inspect).join(', ')}]"
                           end}>"
      end

      alias to_s inspect
    end
  end
end
