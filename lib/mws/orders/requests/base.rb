module MWS
  module Orders
    module Request
      class Base
        attr :client

        def initialize(client)
        end

        def structured_list(attr, values)
          key = attr.match(/.([A-Z].*)/)[1]
          Array(values)
            .each_with_index
            .reduce({}) { |a, (v, i)| a.merge("#{attr}.#{key}.#{i + 1}" => v) }
        end
      end
    end
  end
end
