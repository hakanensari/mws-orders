module MWS
  module Orders
    module Request
      module Tokenable
        def next_token
          node = document.at_xpath('//xmlns:NextToken')
          node.text if node
        end

        def has_next_token?
          !!next_token
        end
      end
    end
  end
end
