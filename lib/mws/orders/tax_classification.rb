# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#TaxClassification
    class TaxClassification < Entity
      attribute :name do
        string('Name')
      end

      attribute(:value) do
        string('Value')
      end
    end
  end
end
