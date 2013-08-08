module MWS
  module Orders
    module Parser
      class Collection < Base
        include Enumerable

        def each
          raise NotImplementedError
        end

        private

        def xpath(path)
          document.xpath("xmlns:#{path}")
        end
      end
    end
  end
end
