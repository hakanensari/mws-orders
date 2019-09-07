# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/MWS_GetServiceStatus.html
    class Message < Entity
      attribute(:locale) do
        string('Locale')
      end

      attribute(:text) do
        string('Text')
      end
    end
  end
end
