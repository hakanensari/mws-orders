# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    class PaymentExecutionDetailItem < Entity
      attribute(:payment) do
        money_at_xpath('Payment')
      end

      attribute(:payment_method) do
        text_at_xpath('PaymentMethod')
      end
    end
  end
end
