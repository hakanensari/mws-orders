# frozen_string_literal: true

require 'mws/orders/collection'
require 'mws/orders/payment_execution_detail_item'

module MWS
  module Orders
    class PaymentExecutionDetail < Collection
      def each
        xpath('PaymentExecutionDetailItem').each do |node|
          yield PaymentExecutionDetailItem.new(node)
        end
      end
    end
  end
end
