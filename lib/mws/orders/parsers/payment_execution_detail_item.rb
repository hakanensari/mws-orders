module MWS
  module Orders
    module Parser
      class PaymentExecutionDetailItem < Model
        value :payment do
          money_at_xpath('Payment')
        end

        value :payment_method do
          text_at_xpath('PaymentMethod')
        end
      end
    end
  end
end
