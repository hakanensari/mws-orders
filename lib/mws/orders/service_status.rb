# frozen_string_literal: true

require 'mws/orders/entity'
require 'mws/orders/message'

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/orders-2013-09-01/MWS_GetServiceStatus.html
    class ServiceStatus < Entity
      attribute(:status) do
        string('Status')
      end

      attribute(:timestamp) do
        time('Timestamp')
      end

      attribute(:message_id) do
        string('MessageId')
      end

      attribute(:messages) do
        xpath('Messages/Message').map { |node| Message.new(node) }
      end
    end
  end
end
