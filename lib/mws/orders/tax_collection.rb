# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/Orders_Datatypes.html#TaxCollection
    class TaxCollection < Entity
      attribute :model do
        string('Model')
      end

      attribute(:responsible_party) do
        string('ResponsibleParty')
      end
    end
  end
end
