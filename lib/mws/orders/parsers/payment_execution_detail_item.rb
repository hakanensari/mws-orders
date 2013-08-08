module MWS
  module Orders
    module Parser
      class PaymentExecutionDetailItem < Model
        def payment
          money_at_xpath('Payment')
        end

        def payment_method
          text_at_xpath('PaymentMethod')
        end
      end
    end
  end
end
