require "peddler"
require "mws/orders/parser"

module MWS
  def self.orders(*args)
    Orders::Client.new(*args).tap do |client|
      client.parser = Orders::Parser
    end
  end
end
