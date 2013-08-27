module MWS
  module Orders
    module Parser
      class Orders < Collection
        extend Forwardable

        def_delegator :order_nodes, :each

        value :order_nodes do
          xpath('Order').map { |node| Order.new(node) }
        end
      end
    end
  end
end
