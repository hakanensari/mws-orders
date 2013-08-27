module MWS
  module Orders
    module Request
      class OrderItems < Base
        include Tokenable

        def list(amazon_order_id)
          parameters(:list_order_items)
            .update(amazon_order_id: amazon_order_id)
            .camelize_keys!

          execute
        end

        def list_by_next_token
          parameters(:list_order_items_by_next_token)
            .update(next_token: next_token)
            .camelize_keys!

          execute
        end

        def next_token
          node = document.at_xpath('//xmlns:NextToken')
          node.text if node
        end
      end
    end
  end
end