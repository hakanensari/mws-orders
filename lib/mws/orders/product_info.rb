# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#ProductInfo
    class ProductInfo < Entity
      attribute(:number_of_items) do
        integer('NumberOfItems')
      end
    end
  end
end
