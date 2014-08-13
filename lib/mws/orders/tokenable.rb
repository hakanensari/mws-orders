module MWS
  module Orders
    module Tokenable
      def next_token
        node = xpath('NextToken')
        node.text if node
      end
    end
  end
end
