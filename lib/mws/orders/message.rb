# frozen_string_literal: true

require 'mws/orders/entity'

module MWS
  module Orders
    class Message < Entity
      attribute(:locale) do
        text_at_xpath('Locale')
      end

      attribute(:text) do
        text_at_xpath('Text')
      end
    end
  end
end
