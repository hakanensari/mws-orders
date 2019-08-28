# frozen_string_literal: true

require 'mws/orders/entity'
require 'mws/orders/message'

module MWS
  module Orders
    class ServiceStatus < Entity
      attribute(:status) do
        text_at_xpath('Status')
      end

      attribute(:timestamp) do
        time_at_xpath('Timestamp')
      end

      attribute(:message_id) do
        text_at_xpath('MessageId')
      end

      attribute(:messages) do
        xpath('Messages/Message').map { |node| Message.new(node) }
      end
    end
  end
end
