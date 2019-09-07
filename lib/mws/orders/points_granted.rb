# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#PointsGranted
    class PointsGranted < Entity
      attribute(:number) do
        integer('PointsNumber')
      end

      attribute(:monetary_value) do
        money('PointsMonetaryValue')
      end
    end
  end
end
