module MWS
  module Orders
    module Parser
      class OrderItems < Collection
        def each(&blk)
          order_item_nodes.each { |node| yield OrderItem.new(node) }
        end

        private

        value :order_item_nodes do
          xpath('OrderItem')
        end
      end
    end
  end
end
