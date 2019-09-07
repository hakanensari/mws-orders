# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#PaymentExecutionDetailItem
    class PaymentExecutionDetailItem < Entity
      attribute(:payment) do
        money('Payment')
      end

      attribute(:payment_method) do
        string('PaymentMethod')
      end
    end
  end
end
