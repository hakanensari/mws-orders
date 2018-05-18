# frozen_string_literal: true

module MWS
  module Orders
    module Tokenable
      def next_token
        node = xpath('NextToken').first
        node&.text
      end
    end
  end
end
