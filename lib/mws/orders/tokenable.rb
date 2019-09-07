# frozen_string_literal: true

module MWS
  module Orders
    # https://docs.developer.amazonservices.com/en_US/dev_guide/DG_NextToken.html
    module Tokenable
      def next_token
        at_xpath('NextToken')&.text
      end
    end
  end
end
