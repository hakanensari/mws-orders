module MWS
  module Orders
    module Request
      class Orders < Base
        include Tokenable

        # Public: Gets specified orders.
        #
        # amazon_order_ids - One or more String Amazon order numbers.
        #
        # Examples
        #
        #   orders.get('123-1234567-1234567')
        #
        # Returns an enumerable list of MWS::Orders::Parser::Orders.
        def get(*amazon_order_ids)
          parameters(:get_order)
            .update(amazon_order_id: amazon_order_ids)
            .format_structured_lists!
            .camelize_keys!

          execute
        end

        # Public: List orders created or updated during a specified time frame.
        #
        # options - The Hash request parameters used to narrow the orders list.
        #           See the MWS Orders API for available parameters.
        #
        # Examples
        #
        #   orders.list(created_after: 1.week.ago)
        #
        # Returns an enumerable list of MWS::Orders::Parser::Orders.
        def list(options)
          options[:marketplace_id] ||= client.home_marketplace_id

          parameters(:list_orders)
            .update(options)
            .timestamp!
            .format_structured_lists!
            .camelize_keys!

          execute
        end

        # Public: Lists the next page of orders using the NextToken parameter.
        #
        # Examples
        #
        #   orders.list_by_next_token
        #
        # Returns an enumerable list of MWS::Orders::Parser::Orders.
        def list_by_next_token
          parameters(:list_orders_by_next_token)
            .update(next_token: next_token)
            .camelize_keys!

          execute
        end

      end
    end
  end
end
