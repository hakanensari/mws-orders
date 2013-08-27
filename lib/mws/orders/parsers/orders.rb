module MWS
  module Orders
    module Parser
      class Orders < Collection
        extend Forwardable

        def_delegator :order_nodes, :each

        private

        def order_nodes
          xpath('Order').map { |node| Order.new(node) }
        end
      end
    end
  end
end
