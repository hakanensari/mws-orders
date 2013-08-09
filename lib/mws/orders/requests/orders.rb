module MWS
  module Orders
    module Request
      class Orders < Base
        def get(amazon_order_id)
        end

        def list(query)
        end

        def list_by_next_token
        end

        private

        def has_next_token?
        end
      end
    end
  end
end
