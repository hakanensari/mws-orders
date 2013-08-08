module MWS
  module Orders
    module Parser
      class Base
        attr :document

        def initialize(document)
          @document = document
        end

        private

        def xpath(path)
          document.xpath("xmlns:#{path}")
        end
      end
    end
  end
end
