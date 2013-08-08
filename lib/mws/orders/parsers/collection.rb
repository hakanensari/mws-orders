module MWS
  module Orders
    module Parser
      class Collection < Base
        include Enumerable

        def each
          raise NotImplementedError
        end
      end
    end
  end
end
