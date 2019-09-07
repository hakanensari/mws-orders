# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#BuyerCustomizedInfo
    class BuyerCustomizedInfo < Entity
      attribute :customized_url do
        string('CustomizedURL')
      end
    end
  end
end
